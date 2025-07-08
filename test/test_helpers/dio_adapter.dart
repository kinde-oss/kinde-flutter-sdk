import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

Dio setupDioMock() {
  final dio = Dio();
  final adapter = DioAdapter(dio: dio);

  adapter.onGet(
    '/.well-known/jwks.json',
    (server) => server.reply(200, {
      "keys": [
        {
          "e": "AQAB",
          "n":
              "2oiN37JkNQqpxqOysqZaeDQPwseeTvNzB7-XnwVo6zwESh71lQTwIRYSNj_Uw6M4acgcRpZY2t5Vqvq-a9as-kGp1S9i5Mqc-P-oD8YnP9WhZ4-DAkwZB_MRBpD-yVA0ClUBQxJPHWD9fkgH6RnGqypwcd3XCR2xV_uXk9ITgYMXkTBQG1c0XvwELjPZQjzGLBFxb21zsuBGHnSD6ju1XEHhNQiiDioQ2G5eO0y669rsTcSgsHiwI9VJbt9fa7mdhYnlGzQ14ucIT9dwza_7wT8o-5y55NxHNf2AY57ApkSfmABwBDdzKQJUjFUK6LdBbNQN8K-TH3yEWPNJU0LJYw",
          "alg": "RS256",
          "kid":
              "9e: ea: ac: 9a: 8c: 7c: d4: 6c: d3: 6c: 8d: f6: 6c: 8b: c5: 68",
          "kty": "RSA",
          "use": "sig"
        }
      ]
    }),
  );

  adapter.onGet(
    'https://authDomain/logout',
    (server) => server.reply(200, null),
  );

  return dio;
}
