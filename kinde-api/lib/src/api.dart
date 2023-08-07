//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_api/src/serializers.dart';
import 'package:kinde_api/src/auth/api_key_auth.dart';
import 'package:kinde_api/src/auth/basic_auth.dart';
import 'package:kinde_api/src/auth/bearer_auth.dart';
import 'package:kinde_api/src/auth/oauth.dart';
import 'package:kinde_api/src/api/business_api.dart';
import 'package:kinde_api/src/api/callbacks_api.dart';
import 'package:kinde_api/src/api/connected_apps_api.dart';
import 'package:kinde_api/src/api/environments_api.dart';
import 'package:kinde_api/src/api/feature_flags_api.dart';
import 'package:kinde_api/src/api/industries_api.dart';
import 'package:kinde_api/src/api/o_auth_api.dart';
import 'package:kinde_api/src/api/organizations_api.dart';
import 'package:kinde_api/src/api/permissions_api.dart';
import 'package:kinde_api/src/api/roles_api.dart';
import 'package:kinde_api/src/api/subscribers_api.dart';
import 'package:kinde_api/src/api/timezones_api.dart';
import 'package:kinde_api/src/api/users_api.dart';

class KindeApi {
  static const String basePath = r'https://app.kinde.com';

  final Dio dio;
  final Serializers serializers;

  KindeApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get BusinessApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BusinessApi getBusinessApi() {
    return BusinessApi(dio, serializers);
  }

  /// Get CallbacksApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  CallbacksApi getCallbacksApi() {
    return CallbacksApi(dio, serializers);
  }

  /// Get ConnectedAppsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ConnectedAppsApi getConnectedAppsApi() {
    return ConnectedAppsApi(dio, serializers);
  }

  /// Get EnvironmentsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EnvironmentsApi getEnvironmentsApi() {
    return EnvironmentsApi(dio, serializers);
  }

  /// Get FeatureFlagsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FeatureFlagsApi getFeatureFlagsApi() {
    return FeatureFlagsApi(dio, serializers);
  }

  /// Get IndustriesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  IndustriesApi getIndustriesApi() {
    return IndustriesApi(dio, serializers);
  }

  /// Get OAuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  OAuthApi getOAuthApi() {
    return OAuthApi(dio, serializers);
  }

  /// Get OrganizationsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  OrganizationsApi getOrganizationsApi() {
    return OrganizationsApi(dio, serializers);
  }

  /// Get PermissionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PermissionsApi getPermissionsApi() {
    return PermissionsApi(dio, serializers);
  }

  /// Get RolesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RolesApi getRolesApi() {
    return RolesApi(dio, serializers);
  }

  /// Get SubscribersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SubscribersApi getSubscribersApi() {
    return SubscribersApi(dio, serializers);
  }

  /// Get TimezonesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TimezonesApi getTimezonesApi() {
    return TimezonesApi(dio, serializers);
  }

  /// Get UsersApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UsersApi getUsersApi() {
    return UsersApi(dio, serializers);
  }
}
