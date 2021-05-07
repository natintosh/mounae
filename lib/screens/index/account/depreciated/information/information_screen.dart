import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class AccountBankInformationScreen extends StatefulWidget {
  static const String path = '/index/account/information';

  @override
  _AccountBankInformationScreenState createState() =>
      _AccountBankInformationScreenState();
}

class _AccountBankInformationScreenState
    extends State<AccountBankInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return _AccountBankInformationView(this);
  }

  void onAuthoriseButtonPressed() {
    AppRouterDelegate.of(context).replace(AccountConfiguration());
  }
}

class _AccountBankInformationView extends WidgetView<
    AccountBankInformationScreen, _AccountBankInformationScreenState> {
  _AccountBankInformationView(_AccountBankInformationScreenState state)
      : super(state);

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
        title: Text('Add New Account'),
        automaticallyImplyLeading: false,
        elevation: 0.sp,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 120.sp),
          child: Column(
            children: [
              SizedBox(height: 42.sp),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 120.sp,
                  width: 120.sp,
                  color: Colors.black12,
                ),
              ),
              SizedBox(height: 24.sp),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.sp),
                  child: Text(
                    'Login your internet banking to gain access to your account informations',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 62.sp),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.sp),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Account Number',
                      labelText: 'Account Number',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.sp),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.sp),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Pin',
                      labelText: 'Pin',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 72.sp),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.onAuthoriseButtonPressed,
                      child: Text('Authorise'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
