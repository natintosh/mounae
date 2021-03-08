import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class AccountChooseBankScreen extends StatefulWidget {
  static const String path = '/index/account/choose-bank';

  @override
  _AccountChooseBankScreenState createState() =>
      _AccountChooseBankScreenState();
}

class _AccountChooseBankScreenState extends State<AccountChooseBankScreen> {
  @override
  Widget build(BuildContext context) {
    return _AccountChooseBankView(this);
  }

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  TextEditingController controller;
  FocusNode focusNode;

  void onBankCardTapped() {
    AppRouterDelegate.of(context).push(AccountBankInformationConfiguration());
  }
}

class _AccountChooseBankView
    extends WidgetView<AccountChooseBankScreen, _AccountChooseBankScreenState> {
  _AccountChooseBankView(_AccountChooseBankScreenState state) : super(state);

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
          child: Column(
            children: [
              SizedBox(height: 46.sp),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose your bank',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 10.sp),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  alignment: Alignment.centerLeft,
                  width: 290.sp,
                  child: Text(
                    'Your first step into financial insight🥳',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 30.sp),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.sp),
                color: MounaeColors.greyBorderColor,
                child: TextField(
                  controller: state.controller,
                  focusNode: state.focusNode,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: MounaeColors.backgroundColor,
                    hintText: 'Search',
                    contentPadding:
                        EdgeInsets.fromLTRB(16.sp, 12.sp, 16.sp, 12.sp),
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
              GridView.builder(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(16.sp, 38.sp, 16.sp, 120.sp),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: (27 / 2).sp,
                ),
                itemCount: 18,
                itemBuilder: (context, index) {
                  return Container(
                    width: 88.sp,
                    height: 88.sp,
                    child: Card(
                      elevation: 3.sp,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.sp),
                      ),
                      child: InkWell(
                        onTap: () {
                          state.onBankCardTapped();
                        },
                        child: Container(
                          padding: EdgeInsets.all(18.sp),
                          child: Container(
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
