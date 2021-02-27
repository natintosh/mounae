import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/pages/set_passcode/set_passcode_page.dart';
import 'package:mounae/utils/themes/theme.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class SetUsername extends StatefulWidget {
  static const String path = '/set-username';

  @override
  _SetUsernameState createState() => _SetUsernameState();
}

class _SetUsernameState extends State<SetUsername> {
  @override
  Widget build(BuildContext context) {
    return _SetUsernameView(this);
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
    _openSetPassCodePage();
  }

  void _openSetPassCodePage() {
    Navigator.of(context).pushNamed(SetPassCodePage.path);
  }
}

class _SetUsernameView extends WidgetView<SetUsername, _SetUsernameState> {
  _SetUsernameView(_SetUsernameState state) : super(state);

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
                      padding: EdgeInsets.only(right: 98.sp, bottom: 16.sp),
                      child: Text.rich(
                        TextSpan(
                          text: "Welcome, What ",
                          children: [
                            TextSpan(
                              text: 'Name ',
                              style:
                                  Theme.of(context).primaryTextTheme.headline5,
                            ),
                            TextSpan(
                              text: 'would you like us to call you ',
                            ),
                          ],
                        ),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 122.sp),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'First Name/Nickname',
                        style: MounaeThemeData.labelTextStyle,
                      ),
                      subtitle: TextFormField(
                        controller: state.controller,
                        focusNode: state.focusNode,
                        style: MounaeThemeData.textFieldTextStyle,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'Example: Ade, Emeka, Umaru',
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
