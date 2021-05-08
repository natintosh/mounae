import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GlobalConnectAccountView extends StatefulWidget {
  @override
  _ConnectAccountViewState createState() => _ConnectAccountViewState();
}

class _ConnectAccountViewState extends State<GlobalConnectAccountView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _ConnectAccountWidgetView(this));
  }

  final GlobalKey webViewKey = GlobalKey();
  late WebViewController webViewController;
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void showIndication(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  String get options => json.encode(
        <String, dynamic>{
          'environment': 'production-sandbox',
          'key': '4c2a3595-5735-52bb-b1d4-89e91d9a91f7',
          'token': '5f74365c05805f088505daa8',
          'source': 'https://app.okra.ng/OSbQa8Crz',
          'isWebView': false,
        },
      );
}

class _ConnectAccountWidgetView
    extends WidgetView<GlobalConnectAccountView, _ConnectAccountViewState> {
  _ConnectAccountWidgetView(_ConnectAccountViewState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                children: [
                  AppBar(),
                  Flexible(
                    child: Container(
                      child: WebView(
                        key: state.webViewKey,
                        initialUrl: 'https://v2-app.okra.ng/OSbQa8Crz',
                        javascriptMode: JavascriptMode.unrestricted,
                        gestureRecognizers: [
                          Factory(() => VerticalDragGestureRecognizer()),
                          Factory(() => TapGestureRecognizer()),
                        ].toSet(),
                        onWebViewCreated: (WebViewController controller) {
                          state.webViewController = controller;
                        },
                        onPageStarted: (String url) {
                          state.showIndication(true);
                          log('url- $url');
                          Uri uri = Uri.parse(url);
                          log('${uri.host}');
                        },
                        onPageFinished: (String url) {
                          state.showIndication(false);
                          state.webViewController.evaluateJavascript(
                              "openOkraWidget('${state.options}')");
                        },
                        javascriptChannels: Set.from([
                          JavascriptChannel(
                              name: 'FlutterOnSuccess',
                              onMessageReceived: (JavascriptMessage message) {
                                log('OnSuccess ${message.message}');
                              }),
                          JavascriptChannel(
                              name: 'FlutterOnError',
                              onMessageReceived: (JavascriptMessage message) {
                                log('OnError ${message.message}');
                              }),
                          JavascriptChannel(
                              name: 'FlutterOnClose',
                              onMessageReceived: (JavascriptMessage message) {
                                log('OnClose ${message.message}');
                              })
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 24)
                ],
              ),
            ),
          ),
          state.isLoading
              ? Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 24.sp,
                    width: 24.sp,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,
                      color: MounaeColors.primaryColor,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
