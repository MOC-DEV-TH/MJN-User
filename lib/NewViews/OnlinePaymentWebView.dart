import 'dart:io';

import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlinePaymentWebView extends StatefulWidget {
  String paymentLink;
  OnlinePaymentWebView(this.paymentLink);


  @override
  _OnlinePaymentWebViewState createState() => _OnlinePaymentWebViewState();
}


class _OnlinePaymentWebViewState extends State<OnlinePaymentWebView> {


  @override
  void initState() {

    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    print(widget.paymentLink);
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: BASE_URL+widget.paymentLink,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
