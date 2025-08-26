import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:MJN/NewViews/NewPaymentView.dart';
import 'package:MJN/utils/app_constants.dart';

class OnlinePaymentWebView extends StatefulWidget {
  final String paymentLink;

  OnlinePaymentWebView(this.paymentLink);

  @override
  State<OnlinePaymentWebView> createState() => _OnlinePaymentWebViewState();
}

class _OnlinePaymentWebViewState extends State<OnlinePaymentWebView> {
  late final WebViewController _controller;
  int changePageIndex = 0;

  @override
  void initState() {
    super.initState();
    changePageIndex = 0;

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Optional: show loading progress
          },
          onPageStarted: (String url) {
            // Optional: handle page start
          },
          onPageFinished: (String url) {
            // Optional: handle page finished
          },
          onHttpError: (HttpResponseError error) {
            // Optional: handle HTTP error
          },
          onWebResourceError: (WebResourceError error) {
            // Optional: handle load error
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(BASE_URL + widget.paymentLink));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button if needed
        return true;
      },
      child: changePageIndex == 1
          ? NewPaymentView()
          : Scaffold(
        body: Container(
          color: Color(0xff188FC5),
          padding: EdgeInsets.all(12),
          child: WebViewWidget(controller: _controller),
        ),
      ),
    );
  }
}
