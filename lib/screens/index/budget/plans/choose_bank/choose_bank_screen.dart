import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetPlanChooseBankScreen extends StatefulWidget {
  static const String path = '/index/budget/create-budget-plan/choose-bank';

  @override
  _BudgetPlanChooseBankScreenState createState() =>
      _BudgetPlanChooseBankScreenState();
}

class _BudgetPlanChooseBankScreenState
    extends State<BudgetPlanChooseBankScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetChooseBankView(this);
  }
}

class _BudgetChooseBankView extends WidgetView<BudgetPlanChooseBankScreen,
    _BudgetPlanChooseBankScreenState> {
  _BudgetChooseBankView(_BudgetPlanChooseBankScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 150.sp,
        child: Container(
          color: Colors.black12,
        ),
      ),
    );
  }
}
