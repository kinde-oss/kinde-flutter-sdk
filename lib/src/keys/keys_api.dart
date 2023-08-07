import 'package:dio/dio.dart';
import 'package:kinde_flutter_sdk/src/keys/keys.dart';

class KeysApi {
  final Dio dio;

  KeysApi(this.dio);

  Future<Keys> getKeys() async {
    final response = await dio.get('/.well-known/jwks.json');
    return Keys.fromJson(response.data);
  }
}
