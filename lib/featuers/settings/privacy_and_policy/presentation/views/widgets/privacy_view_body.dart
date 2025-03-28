// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PrivacyViewBody extends StatefulWidget {
  const PrivacyViewBody({super.key});

  @override
  State<PrivacyViewBody> createState() => _PrivacyViewBodyState();
}

class _PrivacyViewBodyState extends State<PrivacyViewBody> {
  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
        ),
      ),
      onWebViewCreated: (controller) {
        inAppWebViewController = controller;
        inAppWebViewController?.loadUrl(
            urlRequest: URLRequest(
          url: WebUri(
              "https://www.termsfeed.com/live/6fc384af-8e87-4595-9cc1-50dfeb68f9c9"),
        ));
      },
    );
  }
}
