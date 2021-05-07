import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/theme.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class SetUsernameScreen extends StatefulWidget {
  static const String path = '/authentication/set-username';

  @override
  _SetUsernameScreenState createState() => _SetUsernameScreenState();
}

class _SetUsernameScreenState extends State<SetUsernameScreen> {
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

  TextEditingController? controller;
  FocusNode? focusNode;

  void onContinueButtonPressed() {
    FocusScope.of(context).unfocus();
    _openSetPassCodeScreen();
  }

  void _openSetPassCodeScreen() {
    Beamer.of(context).beamToNamed('/authentication/set-passcode');
  }
}

class _SetUsernameView
    extends WidgetView<SetUsernameScreen, _SetUsernameScreenState> {
  _SetUsernameView(_SetUsernameScreenState state) : super(state);

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
