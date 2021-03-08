import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/error_codes.dart' as authError;
import 'package:local_auth/local_auth.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:system_settings/system_settings.dart';

class BiometricsOptionScreen extends StatefulWidget {
  static const String path = '/authentication/biometrics-option';

  @override
  _BiometricsOptionScreenState createState() => _BiometricsOptionScreenState();
}

class _BiometricsOptionScreenState extends State<BiometricsOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return _BiometricsOptionView(this);
  }

  LocalAuthentication localAuthentication = LocalAuthentication();

  void onAuthoriseButtonPressed() async {
    try {
      if (await localAuthentication.canCheckBiometrics) {
        bool didAuthenticate = await localAuthentication.authenticate(
          localizedReason:
              'Please authenticate to allow fingerprint as a sign-in option',
          biometricOnly: true,
        );

        if (didAuthenticate) {
          _openConnectBankOnboardingScreen();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Device does not support biometrics')));
      }
    } on PlatformException catch (e) {
      print(e);
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

  void onCancelButtonPressed() {
    _openConnectBankOnboardingScreen();
  }

  void _openConnectBankOnboardingScreen() {
    AppRouterDelegate.of(context)
        .replaceAll(ConnectBankOnboardingConfiguration());
  }
}

class _BiometricsOptionView
    extends WidgetView<BiometricsOptionScreen, _BiometricsOptionScreenState> {
  _BiometricsOptionView(_BiometricsOptionScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.sp) +
              EdgeInsets.only(top: 58.sp, bottom: 32.sp),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 30.sp) +
                    EdgeInsets.only(top: 67.sp, bottom: 72.sp),
                child: Text(
                  'Perfect! Would you like to use your fingerprints as a Sign-In option?',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontSize: 24.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 36.sp,
              ),
              SvgPicture.asset(
                'assets/svg/fingerprint.svg',
                width: 120.sp,
                height: 120.sp,
              ),
              SizedBox(
                height: 160.sp,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: state.onAuthoriseButtonPressed,
                  child: Text('Authorise'),
                ),
              ),
              SizedBox(
                height: 16.sp,
              ),
              TextButton.icon(
                onPressed: state.onCancelButtonPressed,
                icon: Icon(Icons.cancel),
                label: Text('Cancel'),
                style: Theme.of(context).textButtonTheme.style.copyWith(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        MounaeColors.debitReductionAlertColor),
                    overlayColor: MaterialStateProperty.all<Color>(
                      MounaeColors.debitReductionAlertColor.withOpacity(0.2),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
