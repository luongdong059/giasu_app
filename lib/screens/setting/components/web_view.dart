import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_app/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(TitleConstants.webInfo),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/back.svg",
            height: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.blacasa.vn/',
      ),
    );
  }
}
