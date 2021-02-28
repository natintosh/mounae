import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/pages/authentication/set_username/set_username.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/utils/themes/theme.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class OtpVerificationPage extends StatefulWidget {
  static const String path = '/authentication/otp-verification';

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return _OtpVerificationView(this);
  }

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  TextEditingController controller;
  FocusNode focusNode;

  void onContinueButtonPressed() {
    FocusScope.of(context).unfocus();
    _openSetUsernamePage();
  }

  void _openSetUsernamePage() {
    Navigator.of(context).pushNamed(SetUsername.path);
  }
}

class _OtpVerificationView
    extends WidgetView<OtpVerificationPage, _OtpVerificationPageState> {
  _OtpVerificationView(_OtpVerificationPageState state) : super(state);

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
        padding: EdgeInsets.symmetric(vertical: 24.sp, horizontal: 24.sp),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 48.sp, bottom: 16.sp),
                      child: Text.rich(
                        TextSpan(
                          text: "Let's ",
                          children: [
                            TextSpan(
                              text: 'verify ',
                              style:
                                  Theme.of(context).primaryTextTheme.headline5,
                            ),
                            TextSpan(
                              text: 'your ',
                            ),
                            TextSpan(
                              text: 'Phone Number',
                              style:
                                  Theme.of(context).primaryTextTheme.headline5,
                            ),
                          ],
                        ),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 42.sp),
                        child: Text(
                          'A 6-Digit number have been sent to ${context.read<AuthProvider>().phoneNumber}.',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 21.sp),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(right: 42.sp),
                        child: Text.rich(
                          TextSpan(
                            text: "Resend OTP or Change your medium in ",
                            children: [
                              TextSpan(
                                text: '00:22 ',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                              ),
                            ],
                          ),
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 78.sp),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'One Time Password (OTP)',
                        style: MounaeThemeData.labelTextStyle,
                      ),
                      subtitle: TextFormField(
                        controller: state.controller,
                        focusNode: state.focusNode,
                        style: MounaeThemeData.textFieldTextStyle,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter code here',
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/chat_bubble.svg',
                              width: 18.sp,
                            ),
                            label: Text(
                              'Resend OTP',
                              style: Theme.of(context).primaryTextTheme.caption,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/whatsapp.svg',
                              width: 18.sp,
                            ),
                            label: Text(
                              'Use WhatsApp',
                              style: Theme.of(context).primaryTextTheme.caption,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/phone_dial.svg',
                              width: 18.sp,
                            ),
                            label: Text(
                              'Call me',
                              style: Theme.of(context).primaryTextTheme.caption,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: state.onContinueButtonPressed,
                  child: Text('Continue')),
            )
          ],
        ),
      ),
    );
  }
}
