import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/error_codes.dart' as authError;
import 'package:local_auth/local_auth.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/utils/themes/theme.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';
import 'package:system_settings/system_settings.dart';

class PassCodeScreen extends StatefulWidget {
  @override
  _PassCodeScreenState createState() => _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return _PassCodeView(this);
  }

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  TextEditingController? controller;
  FocusNode? focusNode;

  LocalAuthentication localAuthentication = LocalAuthentication();

  MaskTextInputFormatter digitCodeMaskFormatter = MaskTextInputFormatter(
      mask: '# - # - # - # - # - #', filter: {"#": RegExp(r'[0-9]')});

  void onAuthoriseButtonPressed() async {
    try {
      if (await localAuthentication.canCheckBiometrics) {
        bool didAuthenticate = await localAuthentication.authenticate(
          localizedReason:
              'Please authenticate to allow fingerprint as a sign-in option',
          biometricOnly: true,
        );

        if (didAuthenticate) {
          _openIndexOverviewScreen();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Device does not support biometrics')));
      }
    } on PlatformException catch (e) {
      switch (e.code) {
        case authError.notAvailable:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Security features not enabled'),
              action: SnackBarAction(
                  label: 'Enable', onPressed: _onOpenSecuritySettings),
            ),
          );
          break;
        case authError.notEnrolled:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No biometrics enrolled on this device'),
              action: SnackBarAction(
                  label: 'Enroll', onPressed: _onOpenSecuritySettings),
            ),
          );
          break;
        case authError.passcodeNotSet:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Screen lock not enabled on this device'),
              action: SnackBarAction(
                  label: 'Enable', onPressed: _onOpenSecuritySettings),
            ),
          );
          break;
        case authError.lockedOut:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Device locked due to too may attempts'),
            ),
          );
          break;
        case authError.permanentlyLockedOut:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Device locked due to too may attempts'),
            ),
          );
          break;
        default:
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Authorisation Failed')));
          break;
      }
    }
  }

  void _onOpenSecuritySettings() {
    SystemSettings.security();
  }

  void onContinueButtonPressed() {
    FocusScope.of(context).unfocus();
    _openIndexOverviewScreen();
  }

  void onForgotPassCodeTextTapped() {}

  void _openIndexOverviewScreen() {
    Beamer.of(context).beamToNamed('/index');
    Beamer.of(context).clearBeamLocationHistory();
  }
}

class _PassCodeView extends WidgetView<PassCodeScreen, _PassCodeScreenState> {
  _PassCodeView(_PassCodeScreenState state) : super(state);

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
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(vertical: 24.sp, horizontal: 24.sp),
                child: Column(
                  children: [
                    SizedBox(height: 24.sp),
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Hello ${context.read<AuthProvider>().displayName ?? ''},',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle2,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter Device Passcode',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: CircleAvatar(
                              radius: 40.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 74.sp),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        '6 Digit Code',
                        style: MounaeThemeData.labelTextStyle,
                      ),
                      subtitle: TextFormField(
                        controller: state.controller,
                        focusNode: state.focusNode,
                        style: MounaeThemeData.textFieldTextStyle,
                        keyboardType: TextInputType.number,
                        inputFormatters: [state.digitCodeMaskFormatter],
                        decoration: InputDecoration(
                          hintText: '0 - 0 - 0 - 0 - 0 - 0',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text.rich(
                        TextSpan(
                          text: 'Forgot Passcode? ',
                          style: Theme.of(context).textTheme.bodyText2,
                          recognizer: TapGestureRecognizer()
                            ..onTap = state.onForgotPassCodeTextTapped,
                        ),
                      ),
                    ),
                    SizedBox(height: 36.sp),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Use Fingerprint',
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                      ),
                    ),
                    SizedBox(height: 8.sp),
                    Container(
                      padding: EdgeInsets.all(4.sp),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(shape: CircleBorder()),
                      child: InkWell(
                        onTap: state.onAuthoriseButtonPressed,
                        child: SvgPicture.asset(
                          'assets/svg/fingerprint.svg',
                          clipBehavior: Clip.antiAlias,
                          width: 48.sp,
                          height: 48.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 36.sp),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.sp) +
                  EdgeInsets.only(bottom: 14.sp),
              child: ElevatedButton(
                onPressed: state.onContinueButtonPressed,
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
