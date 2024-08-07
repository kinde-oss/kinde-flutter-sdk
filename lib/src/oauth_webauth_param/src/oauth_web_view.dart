import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kinde_flutter_sdk/src/oauth_webauth_param/src/base/mixin/base_oauth_flow_mixin.dart';
import 'package:kinde_flutter_sdk/src/oauth_webauth_param/src/base/model/oauth_configuration.dart';
import 'package:kinde_flutter_sdk/src/oauth_webauth_param/src/base_web_view.dart';


class OAuthWebView extends BaseWebView {
  final OAuthConfiguration _configuration;

  const OAuthWebView({
    Key? key,
    required OAuthConfiguration configuration,
  })  : _configuration = configuration,
        super(key: key, configuration: configuration);

  @override
  State createState() => OAuthWebViewState();
}

class OAuthWebViewState extends BaseWebViewState<OAuthWebView>
    with WidgetsBindingObserver, BaseOAuthFlowMixin {
  @override
  OAuthConfiguration get configuration => widget._configuration;

  @override
  void initBase() {
    super.initBase();
    initOAuth(
      configuration: configuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? const SizedBox() : super.build(context);
  }
}
