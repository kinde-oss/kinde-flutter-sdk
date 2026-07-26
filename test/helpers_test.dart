import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/utils/helpers.dart';

void main() {
  group('isSafeWebUrl', () {
    group('Valid URLs', () {
      test('should return true for valid https URL', () {
        expect(isSafeWebUrl('https://example.com'), isTrue);
      });

      test('should return true for valid http URL', () {
        expect(isSafeWebUrl('http://example.com'), isTrue);
      });

      test('should return true for URL with path', () {
        expect(isSafeWebUrl('https://example.com/path/to/resource'), isTrue);
      });

      test('should return true for URL with query parameters', () {
        expect(isSafeWebUrl('https://example.com?param=value'), isTrue);
      });

      test('should return true for URL with port', () {
        expect(isSafeWebUrl('https://example.com:8080'), isTrue);
      });

      test('should return true for URL with subdomain', () {
        expect(isSafeWebUrl('https://sub.example.com'), isTrue);
      });

      test('should return true for localhost URL', () {
        expect(isSafeWebUrl('http://localhost:3000'), isTrue);
      });

      test('should return true for IP address URL', () {
        expect(isSafeWebUrl('http://192.168.1.1:8080'), isTrue);
      });
    });

    group('Invalid URLs', () {
      test('should return false for empty string', () {
        expect(isSafeWebUrl(''), isFalse);
      });

      test('should return false for null-like empty string', () {
        expect(isSafeWebUrl('   '), isFalse);
      });

      test('should return false for relative URL', () {
        expect(isSafeWebUrl('/path/to/resource'), isFalse);
      });

      test('should return false for URL without scheme', () {
        expect(isSafeWebUrl('example.com'), isFalse);
      });

      test('should return false for file:// scheme', () {
        expect(isSafeWebUrl('file:///path/to/file'), isFalse);
      });

      test('should return false for ftp:// scheme', () {
        expect(isSafeWebUrl('ftp://ftp.example.com'), isFalse);
      });

      test('should return false for custom scheme', () {
        expect(isSafeWebUrl('myapp://callback'), isFalse);
      });

      test('should return false for javascript: scheme', () {
        expect(isSafeWebUrl('javascript:alert(1)'), isFalse);
      });

      test('should return false for data: scheme', () {
        expect(isSafeWebUrl('data:text/html,<script>alert(1)</script>'), isFalse);
      });

      test('should return false for URL without host', () {
        expect(isSafeWebUrl('http://'), isFalse);
      });

      test('should return false for malformed URL', () {
        expect(isSafeWebUrl('not a url at all'), isFalse);
      });
    });

    group('Edge Cases', () {
      test('should handle URL with user info', () {
        expect(isSafeWebUrl('https://user:pass@example.com'), isTrue);
      });

      test('should handle URL with deep path', () {
        expect(isSafeWebUrl('https://example.com/path/to/resource'), isTrue);
      });

      test('should handle very long URL', () {
        final longPath = 'a' * 1000;
        expect(isSafeWebUrl('https://example.com/$longPath'), isTrue);
      });

      test('should be case insensitive for scheme', () {
        expect(isSafeWebUrl('HTTPS://example.com'), isTrue);
        expect(isSafeWebUrl('HTTP://example.com'), isTrue);
        expect(isSafeWebUrl('Https://example.com'), isTrue);
      });
    });
  });
}

