import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class SignUpPage extends StatefulWidget {
  static const String path = '/signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return _SignUpView(this);
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
}

class _SignUpView extends WidgetView<SignUpPage, _SignUpPageState> {
  _SignUpView(_SignUpPageState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        state.focusNode.unfocus();
      }),
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
            Padding(
              padding: EdgeInsets.only(right: 92.sp),
              child: Text.rich(
                TextSpan(
                  text: 'Your ',
                  children: [
                    TextSpan(
                      text: 'phone number ',
                      style: Theme.of(context).primaryTextTheme.headline5,
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
            TextFormField(
              controller: state.controller,
              focusNode: state.focusNode,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 16.0, bottom: 6.0),
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
                labelText: 'Phone Number',
                hintText: '${!state.showPrefixText ? '+234-' : ''}700-123-1234',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
