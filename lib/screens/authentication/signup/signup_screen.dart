import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/utils/themes/theme.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return _SignUpView(this);
  }

  @override
  void initState() {
    focusNode = FocusNode()
      ..addListener(() {
        if (focusNode!.hasFocus || controller!.text.isNotEmpty) {
          setState(() {
            showPrefixText = true;
          });
        } else {
          setState(() {
            showPrefixText = false;
          });
        }
      });
    controller = TextEditingController();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  bool showPrefixText = false;

  TextEditingController? controller;
  FocusNode? focusNode;

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '###-###-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  void onContinueButtonPressed() {
    FocusScope.of(context).unfocus();
    String phoneNumber =
        '+234' + controller!.text.replaceAll(RegExp(r'[^\d]+'), '');
    context.read<AuthProvider>()..phoneNumber = phoneNumber;
    _openOtpSendScreen();
  }

  void _openOtpSendScreen() {
    Beamer.of(context).beamToNamed('/authentication/send-otp');
  }
}

class _SignUpView extends WidgetView<SignUpScreen, _SignUpScreenState> {
  _SignUpView(_SignUpScreenState state) : super(state);

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
            Beamer.of(context).beamBack();
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
                      padding: EdgeInsets.only(right: 92.sp),
                      child: Text.rich(
                        TextSpan(
                          text: 'Your ',
                          children: [
                            TextSpan(
                              text: 'phone number ',
                              style:
                                  Theme.of(context).primaryTextTheme.headline5,
                            ),
                            TextSpan(
                              text:
                                  'Begins your journey to achieve your financial goal',
                            )
                          ],
                        ),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 86.sp),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Phone Number',
                        style: MounaeThemeData.labelTextStyle,
                      ),
                      subtitle: TextFormField(
                        controller: state.controller,
                        focusNode: state.focusNode,
                        style: MounaeThemeData.textFieldTextStyle,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          state.maskFormatter,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                            child: SizedBox(
                              width: 4.sp,
                              height: 4.sp,
                              child: SvgPicture.asset(
                                'assets/svg/nigeria_flag.svg',
                                height: 4.sp,
                                width: 4.sp,
                              ),
                            ),
                          ),
                          prefixText: state.showPrefixText ? '+234-' : null,
                          hintText:
                              '${!state.showPrefixText ? '+234-' : ''}700-123-1234',
                        ),
                      ),
                    ),
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
