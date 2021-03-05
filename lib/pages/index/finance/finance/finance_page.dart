import 'package:flutter/material.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class FinancePage extends StatefulWidget {
  static const String path = '/index/finance';
  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  @override
  Widget build(BuildContext context) {
    return _FinancePageView(this);
  }
}

class _FinancePageView extends WidgetView<FinancePage, _FinancePageState> {
  _FinancePageView(_FinancePageState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
