import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'web_view_method_channel.dart';

abstract class WebViewPlatform extends PlatformInterface {
  /// Constructs a WebViewPlatform.
  WebViewPlatform() : super(token: _token);

  static final Object _token = Object();

  static WebViewPlatform _instance = MethodChannelWebView();

  /// The default instance of [WebViewPlatform] to use.
  ///
  /// Defaults to [MethodChannelWebView].
  static WebViewPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WebViewPlatform] when
  /// they register themselves.
  static set instance(WebViewPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
