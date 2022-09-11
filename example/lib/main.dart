import 'package:flutter/material.dart';
import 'package:web_view/web_view.dart';

void main() => runApp(const MaterialApp(home: WebViewExample()));

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key}) : super(key: key);

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final TextEditingController _urlController;
  late final WebViewController _webViewController;
  @override
  void initState() {
    _urlController = TextEditingController(text: 'https://flutter.dev/');
    super.initState();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter WebView example')),
      body: Column(
        children: [
          TextFormField(
            controller: _urlController,
          ),
          ElevatedButton(
            onPressed: () =>
                _webViewController.setUrl(url: _urlController.text),
            child: const Text('Load Url'),
          ),
          Expanded(
            child: WebView(
              onMapViewCreated: _onMapViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  // load default
  void _onMapViewCreated(WebViewController controller) {
    _webViewController = controller;
    controller.setUrl(url: _urlController.text);
  }
}
