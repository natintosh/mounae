import 'package:flutter/material.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetChooseBankScreen extends StatefulWidget {
  static const String path = '/index/budget/create-budget-plan/choose-bank';

  @override
  _BudgetChooseBankScreenState createState() => _BudgetChooseBankScreenState();
}

class _BudgetChooseBankScreenState extends State<BudgetChooseBankScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetChooseBankView(this);
  }
}

class _BudgetChooseBankView
    extends WidgetView<BudgetChooseBankScreen, _BudgetChooseBankScreenState> {
  _BudgetChooseBankView(_BudgetChooseBankScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        color: Colors.white,
      ),
    );
  }
}
