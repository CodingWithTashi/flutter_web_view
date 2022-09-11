import 'package:flutter_test/flutter_test.dart';
import 'package:web_view/web_view.dart';
import 'package:web_view/web_view_platform_interface.dart';
import 'package:web_view/web_view_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWebViewPlatform
    with MockPlatformInterfaceMixin
    implements WebViewPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WebViewPlatform initialPlatform = WebViewPlatform.instance;

  test('$MethodChannelWebView is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWebView>());
  });

  test('getPlatformVersion', () async {
    WebView webViewPlugin = WebView();
    MockWebViewPlatform fakePlatform = MockWebViewPlatform();
    WebViewPlatform.instance = fakePlatform;

    expect(await webViewPlugin.getPlatformVersion(), '42');
  });
}
