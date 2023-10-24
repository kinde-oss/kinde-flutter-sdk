import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:dio/dio.dart';
import '../test/test_helpers/dio_mock.dart';

/// tests for CallbacksApi
void main() {
  //final instance = KindeApi().getCallbacksApi();
  Dio dio = DioAdapterMock();
  CallbacksApi instance = KindeApi(dio: dio).getCallbacksApi();

  group(CallbacksApi, () {
    // Add Redirect Callback URLs
    //
    // Add additional redirect callback URLs.
    //
    //Future<SuccessResponse> addRedirectCallbackURLs(String appId, ReplaceRedirectCallbackURLsRequest replaceRedirectCallbackURLsRequest) async
    test('test addRedirectCallbackURLs', () async {
      // TODO
      final responseData = await instance.addRedirectCallbackURLs(
          appId: 'test_id',
          replaceRedirectCallbackURLsRequest:
              ReplaceRedirectCallbackURLsRequest());
      expect(responseData, isNotNull);
    });

    // Delete Callback URLs
    //
    // Delete callback URLs.
    //
    //Future<SuccessResponse> deleteCallbackURLs(String appId, String urls) async
    test('test deleteCallbackURLs', () async {
      // TODO
      final responseData =
          await instance.deleteCallbackURLs(appId: 'test_id', urls: 'test_url');
      expect(responseData, isNotNull);
    });

    // List Callback URLs
    //
    // Returns an application's redirect callback URLs.
    //
    //Future<RedirectCallbackUrls> getCallbackURLs(String appId) async
    test('test getCallbackURLs', () async {
      // TODO
      final responseData = await instance.getCallbackURLs(appId: 'test_id');
      expect(responseData, isNotNull);
    });

    // Replace Redirect Callback URLs
    //
    // Replace all redirect callback URLs.
    //
    //Future<SuccessResponse> replaceRedirectCallbackURLs(String appId, ReplaceRedirectCallbackURLsRequest replaceRedirectCallbackURLsRequest) async
    test('test replaceRedirectCallbackURLs', () async {
      // TODO
      final responseData = await instance.replaceRedirectCallbackURLs(
        appId: 'test_id',
        replaceRedirectCallbackURLsRequest:
            ReplaceRedirectCallbackURLsRequest(),
      );
      expect(responseData, isNotNull);
    });
  });
}
