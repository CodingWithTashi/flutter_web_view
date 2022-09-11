import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'web_view_platform_interface.dart';

/// An implementation of [WebViewPlatform] that uses method channels.
class MethodChannelWebView extends WebViewPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('web_view');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
