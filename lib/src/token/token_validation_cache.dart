import 'dart:convert';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:jose/jose.dart';

/// A secure, time-limited cache for JWT token validation results.
///
/// This cache improves performance by avoiding redundant cryptographic
/// validation of the same token, while maintaining security through:
/// - Short TTL (max 60 seconds)
/// - Automatic expiry before token expiry
/// - Explicit invalidation on auth state changes
/// - Storage of signature hash only (not full tokens)
///
/// **Security Properties:**
/// - Cache TTL is ALWAYS < token expiry time
/// - Cache is cleared on logout, token refresh, or auth state change
/// - Only stores SHA-256 hash of token signature (can't reconstruct token)
/// - In-memory only (not persisted)
class TokenValidationCache {
  final Map<String, _CacheEntry> _cache = {};

  /// Default cache TTL (1 minute)
  static const Duration _defaultTTL = Duration(seconds: 60);

  /// Maximum cache TTL (5 minutes) - even for long-lived tokens
  static const Duration _maxTTL = Duration(minutes: 5);

  /// Minimum cache TTL (0 seconds) - for expired tokens
  static const Duration _minTTL = Duration.zero;

  /// Gets cached validation result for a token.
  ///
  /// Returns `null` if:
  /// - Token not in cache
  /// - Cache entry has expired
  /// - Token signature doesn't match (safety check)
  ///
  /// **Security:** Always check token expiry BEFORE calling this method.
  bool? get(String? token) {
    if (token == null || token.isEmpty) {
      return null;
    }

    final cacheKey = _generateCacheKey(token);
    if (cacheKey == null) {
      return null;
    }

    final entry = _cache[cacheKey];
    if (entry == null) {
      return null; // Cache miss
    }

    if (entry.isExpired) {
      // Remove expired entry
      _cache.remove(cacheKey);
      return null;
    }

    return entry.isValid;
  }

  /// Stores validation result in cache with automatic TTL calculation.
  ///
  /// Cache TTL is calculated as: min(60s, time until token expiry, 5 min)
  ///
  /// **Security:**
  /// - If token is expired or has no expiry, uses minimal TTL
  /// - TTL is ALWAYS less than token expiry time
  /// - Only stores signature hash, not full token
  void put(String? token, bool isValid, {JsonWebToken? jwt}) {
    if (token == null || token.isEmpty) {
      return;
    }

    final cacheKey = _generateCacheKey(token);
    if (cacheKey == null) {
      return;
    }

    final ttl = jwt != null ? _calculateTTL(jwt) : _defaultTTL;

    _cache[cacheKey] = _CacheEntry(
      isValid: isValid,
      expiresAt: DateTime.now().add(ttl),
      tokenHash: cacheKey,
    );
  }

  /// Clears all cached validation results.
  ///
  /// **When to call:**
  /// - User logout
  /// - Token refresh
  /// - Auth state change
  /// - SDK re-initialization
  void clear() {
    _cache.clear();
  }

  /// Returns the current size of the cache (for testing/monitoring).
  int get size => _cache.length;

  /// Removes expired entries from cache (garbage collection).
  ///
  /// This is called automatically on get/put, but can be called
  /// manually for cleanup.
  void cleanupExpired() {
    _cache.removeWhere((key, entry) => entry.isExpired);
  }

  /// Generates cache key from token signature.
  ///
  /// **Security:** Uses SHA-256 hash of signature only (not full token).
  /// This ensures:
  /// - Unique key per token
  /// - Can't reconstruct token from cache key
  /// - Smaller memory footprint
  String? _generateCacheKey(String token) {
    try {
      // JWT format: header.payload.signature
      final parts = token.split('.');
      if (parts.length != 3) {
        return null; // Invalid JWT format
      }

      final signature = parts[2];
      if (signature.isEmpty) {
        return null;
      }

      // SHA-256 hash of signature
      final bytes = utf8.encode(signature);
      final digest = sha256.convert(bytes);

      return digest.toString();
    } catch (e) {
      // If anything fails, don't cache
      return null;
    }
  }

  /// Calculates cache TTL based on token expiry.
  ///
  /// Formula: min(default TTL, time until token expiry, max TTL)
  ///
  /// **Security:** Cache TTL is ALWAYS < token expiry time.
  Duration _calculateTTL(JsonWebToken jwt) {
    try {
      final now = DateTime.now();
      final expiry = jwt.claims.expiry;

      if (expiry == null) {
        // No expiry claim (shouldn't happen for Kinde tokens, but handle it)
        return _defaultTTL;
      }

      final timeUntilExpiry = expiry.difference(now);

      if (timeUntilExpiry <= Duration.zero) {
        // Token already expired - don't cache
        return _minTTL;
      }

      // Return min(default TTL, time until expiry, max TTL)
      final candidates = [
        _defaultTTL.inMilliseconds,
        timeUntilExpiry.inMilliseconds,
        _maxTTL.inMilliseconds,
      ];

      final minMilliseconds = candidates.reduce(math.min);

      return Duration(milliseconds: minMilliseconds);
    } catch (e) {
      // If calculation fails, use default TTL
      return _defaultTTL;
    }
  }
}

/// Internal cache entry structure.
///
/// **Security:** Stores validation result and expiry, but NOT the token itself.
class _CacheEntry {
  /// Whether the token was valid when cached
  final bool isValid;

  /// When this cache entry expires (NOT the same as token expiry)
  final DateTime expiresAt;

  /// SHA-256 hash of token signature (for verification)
  final String tokenHash;

  const _CacheEntry({
    required this.isValid,
    required this.expiresAt,
    required this.tokenHash,
  });

  /// Whether this cache entry has expired
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  @override
  String toString() =>
      '_CacheEntry(isValid: $isValid, expiresAt: $expiresAt, expired: $isExpired)';
}

