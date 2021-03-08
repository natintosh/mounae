import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/theme.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String path = '/authentication/signin';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return _SignInView(this);
  }

  @override
  void initState() {
    focusNode = FocusNode()
      ..addListener(() {
        if (focusNode.hasFocus || controller.text.isNotEmpty) {
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

  TextEditingController controller;
  FocusNode focusNode;

  MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '###-###-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  void onContinueButtonPressed() {
    FocusScope.of(context).unfocus();
    String phoneNumber =
        '+234' + controller.text.replaceAll(RegExp(r'[^\d]+'), '');
    context.read<AuthProvider>()..phoneNumber = phoneNumber;
    _openPassCodeScreen();
  }

  void _openPassCodeScreen() {
    AppRouterDelegate.of(context).push(PassCodeConfiguration());
  }

  void onSignUpTextTapped() {
    AppRouterDelegate.of(context).push(SignUpRouteConfiguration());
  }
}

class _SignInView extends WidgetView<SignInScreen, _SignInScreenState> {
  _SignInView(_SignInScreenState state) : super(state);

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
                      padding: EdgeInsets.only(right: 92.sp),
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Continue your journey to financial freedom with your ',
                          children: [
                            TextSpan(
                              text: 'phone number ',
                              style:
                                  Theme.of(context).primaryTextTheme.headline5,
                            ),
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
            ),
            SizedBox(height: 24.sp),
            Container(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: 'Are you a new user? ',
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                      recognizer: TapGestureRecognizer()
                        ..onTap = state.onSignUpTextTapped,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.sp),
          ],
        ),
      ),
    );
  }
}
