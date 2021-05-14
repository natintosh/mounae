import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mounae/global/page_route/slide_up_dialog_transition_route.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef WidgetOnError = void Function(AccountConnectionHandler? handler);

class AccountConnectionHandler {
  final String data;
  final bool isSuccessful;
  final bool hasError;

  AccountConnectionHandler({
    required this.data,
    required this.isSuccessful,
    required this.hasError,
  });
}

class GlobalConnectAccountView extends StatefulWidget {
  final WidgetOnError onError;

  GlobalConnectAccountView({
    required this.onError,
  });

  @override
  _ConnectAccountViewState createState() => _ConnectAccountViewState();

  static void show(BuildContext context, {required WidgetOnError onError}) {
    Navigator.of(context).push(
      SlideUpDialogTransitionRoute(
        child: GlobalConnectAccountView(
          onError: onError,
        ),
      ),
    );
  }
}

class _ConnectAccountViewState extends State<GlobalConnectAccountView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(child: _ConnectAccountWidgetView(this)));
  }

  final GlobalKey webViewKey = GlobalKey();
  late WebViewController webViewController;
  late bool isLoading = true;

  AccountConnectionHandler? handler;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void widgetOnClose() {
    Navigator.of(context).pop();
    widget.onError(handler);
  }

  void showIndication(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  Future<bool> onWillPop() async {
    widgetOnClose();
    return true;
  }
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
            padding:
                EdgeInsets.symmetric(vertical: 12.0.sp, horizontal: 12.0.sp),
            child: Card(
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0.sp),
              ),
              child: Column(
                children: [
                  SizedBox(height: 24.sp),
                  Flexible(
                    child: Container(
                      child: WebView(
                        key: state.webViewKey,
                        initialUrl: 'about:blank',
                        javascriptMode: JavascriptMode.unrestricted,
                        gestureRecognizers: [
                          Factory(() => VerticalDragGestureRecognizer()),
                          Factory(() => TapGestureRecognizer()),
                        ].toSet(),
                        onWebViewCreated: (WebViewController controller) {
                          state.webViewController = controller;
                          loadPageFromAssets();
                        },
                        onPageStarted: (String url) {
                          state.showIndication(true);
                        },
                        onPageFinished: (String url) {
                          state.showIndication(false);
                        },
                        javascriptChannels: Set.from([
                          JavascriptChannel(
                              name: 'WidgetOnSuccess',
                              onMessageReceived: (JavascriptMessage message) {
                                state.handler = AccountConnectionHandler(
                                    data: message.message,
                                    isSuccessful: true,
                                    hasError: false);
                              }),
                          JavascriptChannel(
                              name: 'WidgetOnError',
                              onMessageReceived: (JavascriptMessage message) {
                                state.handler = AccountConnectionHandler(
                                    data: message.message,
                                    isSuccessful: false,
                                    hasError: true);
                              }),
                          JavascriptChannel(
                              name: 'WidgetOnClose',
                              onMessageReceived: (JavascriptMessage message) {
                                state.widgetOnClose();
                              }),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.sp)
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

  void loadPageFromAssets() async {
    String fileText = await rootBundle.loadString('assets/html/okra.html');

    state.webViewController.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
