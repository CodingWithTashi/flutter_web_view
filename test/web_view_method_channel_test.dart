import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web_view/web_view_method_channel.dart';

void main() {
  MethodChannelWebView platform = MethodChannelWebView();
  const MethodChannel channel = MethodChannel('web_view');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
