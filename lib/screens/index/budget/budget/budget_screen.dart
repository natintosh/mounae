import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetScreen extends StatefulWidget {
  static const String path = '/index/budget';

  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetView(this);
  }

  void onAppBarBackButtonPressed() {
    AppRouterDelegate.of(context).replaceAll(IndexConfiguration());
  }
}

class _BudgetView extends WidgetView<BudgetScreen, _BudgetScreenState> {
  _BudgetView(_BudgetScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget'),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.sp,
          ),
          onPressed: state.onAppBarBackButtonPressed,
        ),
      ),
      body: Container(),
    );
  }
}
