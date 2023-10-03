import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/widgets/custom_appBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({super.key, required this.articleModel});
  ArticleModel articleModel;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('${widget.articleModel.url}'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          greenWord: "News ",
          blackWord: 'Details',
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
