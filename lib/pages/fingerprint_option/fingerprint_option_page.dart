import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class FingerPrintOptionPage extends StatefulWidget {
  static const String path = '/fingerprint-option';

  @override
  _FingerPrintOptionPageState createState() => _FingerPrintOptionPageState();
}

class _FingerPrintOptionPageState extends State<FingerPrintOptionPage> {
  @override
  Widget build(BuildContext context) {
    return _FingerPrintOptionView(this);
  }

  void onContinueButtonPressed() {}
}

class _FingerPrintOptionView
    extends WidgetView<FingerPrintOptionPage, _FingerPrintOptionPageState> {
  _FingerPrintOptionView(_FingerPrintOptionPageState state) : super(state);

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
                    onPressed: state.onContinueButtonPressed,
                    child: Text('Continue')),
              ),
              SizedBox(
                height: 16.sp,
              ),
              TextButton.icon(
                onPressed: () {},
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
