import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class OtpSendScreen extends StatefulWidget {
  static const String path = '/authentication/otp-send';

  @override
  _OtpSendScreenState createState() => _OtpSendScreenState();
}

class _OtpSendScreenState extends State<OtpSendScreen> {
  @override
  Widget build(BuildContext context) {
    return _OtpSendView(this);
  }

  void onReceiveListTileTap() {
    _openOtpVerificationScreen();
  }

  void _openOtpVerificationScreen() {
    AppRouterDelegate.of(context).push(OtpVerificationConfiguration());
  }
}

class _OtpSendView extends WidgetView<OtpSendScreen, _OtpSendScreenState> {
  _OtpSendView(_OtpSendScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.sp,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        elevation: 0.sp,
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 92.sp) +
                  EdgeInsets.symmetric(vertical: 24.sp, horizontal: 24.sp),
              child: Text.rich(
                TextSpan(
                  text: 'How would you like to ',
                  children: [
                    TextSpan(
                      text: 'receive ',
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                    TextSpan(
                      text: 'your ',
                    ),
                    TextSpan(
                      text: 'OTP/Verification code?',
                      style: Theme.of(context).primaryTextTheme.headline5,
                    ),
                  ],
                ),
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 86.sp),
            ...ListTile.divideTiles(
                color: MounaeColors.dividerColor,
                context: context,
                tiles: [
                  ListTile(
                    onTap: state.onReceiveListTileTap,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.sp,
                      horizontal: 16.sp,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg/chat_bubble.svg',
                      width: 24.sp,
                    ),
                    title: Text('Receive Via SMS'),
                    subtitle: Text(
                      'A One-Time Passcode would be sent to phone via SMS',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  ListTile(
                    onTap: state.onReceiveListTileTap,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.sp,
                      horizontal: 16.sp,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg/phone_dial.svg',
                      width: 24.sp,
                    ),
                    title: Text('Receive Via Phone Call'),
                    subtitle: Text(
                      'We would call your phone to provide you your One-Time passcode',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  ListTile(
                    onTap: state.onReceiveListTileTap,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.sp,
                      horizontal: 16.sp,
                    ),
                    leading: SvgPicture.asset(
                      'assets/svg/whatsapp.svg',
                      width: 24.sp,
                    ),
                    title: Text('Receive Via WhatsApp'),
                    subtitle: Text(
                      'Receive your One-Time Passcode via your WhatsApp messenger',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ]).toList()
          ],
        ),
      )),
    );
  }
}
