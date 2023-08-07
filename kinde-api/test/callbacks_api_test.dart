import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for CallbacksApi
void main() {
  final instance = KindeApi().getCallbacksApi();

  group(CallbacksApi, () {
    // Add Redirect Callback URLs
    //
    // Add additional redirect callback URLs. 
    //
    //Future<SuccessResponse> addRedirectCallbackURLs(String appId, ReplaceRedirectCallbackURLsRequest replaceRedirectCallbackURLsRequest) async
    test('test addRedirectCallbackURLs', () async {
      // TODO
    });

    // Delete Callback URLs
    //
    // Delete callback URLs. 
    //
    //Future<SuccessResponse> deleteCallbackURLs(String appId, String urls) async
    test('test deleteCallbackURLs', () async {
      // TODO
    });

    // List Callback URLs
    //
    // Returns an application's redirect callback URLs. 
    //
    //Future<RedirectCallbackUrls> getCallbackURLs(String appId) async
    test('test getCallbackURLs', () async {
      // TODO
    });

    // Replace Redirect Callback URLs
    //
    // Replace all redirect callback URLs. 
    //
    //Future<SuccessResponse> replaceRedirectCallbackURLs(String appId, ReplaceRedirectCallbackURLsRequest replaceRedirectCallbackURLsRequest) async
    test('test replaceRedirectCallbackURLs', () async {
      // TODO
    });

  });
}
