import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/theme.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class SetPassCodeScreen extends StatefulWidget {
  static const String path = '/authentication/set-passcode';

  @override
  _SetPassCodeScreenState createState() => _SetPassCodeScreenState();
}

class _SetPassCodeScreenState extends State<SetPassCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return _SetPassCodeView(this);
  }

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  TextEditingController controller;
  FocusNode focusNode;

  MaskTextInputFormatter digitCodeMaskFormatter = MaskTextInputFormatter(
      mask: '# - # - # - # - # - #', filter: {"#": RegExp(r'[0-9]')});

  void onContinueButtonPressed() {
    FocusScope.of(context).unfocus();
    _openSetPassCodeConfirmationScreen();
  }

  void _openSetPassCodeConfirmationScreen() {
    AppRouterDelegate.of(context).push(SetPassCodeConfirmationConfiguration());
  }
}

class _SetPassCodeView
    extends WidgetView<SetPassCodeScreen, _SetPassCodeScreenState> {
  _SetPassCodeView(_SetPassCodeScreenState state) : super(state);

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
                    Container(
                      padding: EdgeInsets.only(right: 98.sp, bottom: 16.sp),
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: "Set a 6 digit device passcode",
                        ),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 72.sp, bottom: 16.sp),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'This Passcode would be used to sign in to your account',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 122.sp),
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
