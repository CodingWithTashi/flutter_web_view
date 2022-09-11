import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef FlutterWebViewCreatedCallback = void Function(
    WebViewController controller);

class WebView extends StatelessWidget {
  final FlutterWebViewCreatedCallback onMapViewCreated;
  const WebView({Key? key, required this.onMapViewCreated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: 'plugins.codingwithtashi/flutter_web_view',
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: 'plugins.codingwithtashi/flutter_web_view',
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      default:
        return Text(
            '$defaultTargetPlatform is not yet supported by the web_view plugin');
    }
  }

  // Callback method when platform view is created
  void _onPlatformViewCreated(int id) =>
      onMapViewCreated(WebViewController._(id));
}

// WebView Controller class to set url etc
class WebViewController {
  WebViewController._(int id)
      : _channel =
            MethodChannel('plugins.codingwithtashi/flutter_web_view_$id');

  final MethodChannel _channel;

  Future<void> setUrl({required String url}) async {
    return _channel.invokeMethod('setUrl', url);
  }
}
