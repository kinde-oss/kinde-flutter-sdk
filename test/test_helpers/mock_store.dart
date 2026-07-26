import 'package:kinde_flutter_sdk/src/keys/keys.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';

/// Mock store for testing that doesn't require Flutter secure storage.
/// This provides direct access to auth state manipulation for unit tests.
class MockStore {
  AuthState? _authState;
  Keys? _keys;

  AuthState? get authState => _authState;
  set authState(AuthState? value) => _authState = value;

  Keys? get keys => _keys;
  set keys(Keys? value) => _keys = value;

  Future<void> clear() async {
    _authState = null;
    _keys = null;
  }

  Future<void> loadFromStorage() async {
    // No-op for mock - state is set directly
  }
}

