import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
   WebViewScreen({super.key, required this.url});

   final String url;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}


class _WebViewScreenState extends State<WebViewScreen> {
  final WebViewController _Controller =WebViewController();
  @override
  void initState() {
    _Controller..loadRequest(Uri.parse(widget.url));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: _Controller),
      );
  }
}
