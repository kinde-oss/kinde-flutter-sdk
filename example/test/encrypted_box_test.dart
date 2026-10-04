import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_starter_kit/encrypted_box.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  late Map<String, String> values;
  late List<MethodCall> calls;

  setUp(() async {
    values = {'unrelated-app-secret': 'keep-me'};
    calls = [];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          final arguments = Map<String, Object?>.from(call.arguments as Map);
          final key = arguments['key'] as String;
          switch (call.method) {
            case 'read':
              return values[key];
            case 'write':
              values[key] = arguments['value'] as String;
              return null;
            case 'delete':
              values.remove(key);
              return null;
            default:
              throw StateError('Unexpected storage operation: ${call.method}');
          }
        });
    await EncryptedBox.init();
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test(
    'saved token survives reinitialization using supported storage options',
    () async {
      String encode(Map<String, Object> value) =>
          base64UrlEncode(utf8.encode(jsonEncode(value))).replaceAll('=', '');
      final token =
          '${encode({'alg': 'none'})}.'
          '${encode({'exp': DateTime.now().millisecondsSinceEpoch ~/ 1000 + 3600})}.'
          'test-signature';
      await EncryptedBox.instance.saveToken(token);
      await EncryptedBox.init();

      expect(await EncryptedBox.instance.returnAccessToken(), token);
      expect(values['app_token'], token);
      final options = (calls.first.arguments as Map)['options'] as Map;
      expect(options, isNot(contains('encryptedSharedPreferences')));
      expect(values['unrelated-app-secret'], 'keep-me');
    },
  );

  test(
    'clearing example token does not erase Kinde or unrelated secrets',
    () async {
      values['kinde_auth_state'] = 'test-sdk-session';
      await EncryptedBox.instance.saveToken('test-token');
      await EncryptedBox.instance.clear();

      expect(values, isNot(contains('app_token')));
      expect(values['kinde_auth_state'], 'test-sdk-session');
      expect(values['unrelated-app-secret'], 'keep-me');
      expect(calls.map((call) => call.method), ['write', 'delete']);
    },
  );
}
