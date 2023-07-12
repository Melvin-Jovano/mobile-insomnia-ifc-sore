import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MingguLimaBelasWebView extends StatefulWidget {
  final String url;
  
  const MingguLimaBelasWebView({
    super.key,
    required this.url
  });

  @override
  State<MingguLimaBelasWebView> createState() => _MingguLimaBelasWebViewState();
}

class _MingguLimaBelasWebViewState extends State<MingguLimaBelasWebView> {

  @override
  void initState() {
    super.initState();

    if(Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Berita'),
          backgroundColor: const Color(0xff001f2e),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => {
              Navigator.pop(context)
            },
          ),
        ),
        body: WebView(
          initialUrl: widget.url,
        )
      )
    );
  }
}