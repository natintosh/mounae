import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetExpensePlanScreen extends StatefulWidget {
  static const String path = '/index/budget/create-budget-plan/expense-plan';

  @override
  _BudgetExpensePlanScreenState createState() =>
      _BudgetExpensePlanScreenState();
}

class _BudgetExpensePlanScreenState extends State<BudgetExpensePlanScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetExpensePlanView(this);
  }

  void onContinueButtonPressed() {
    AppRouterDelegate.of(context).push(BudgetIncomeAmountConfiguration());
  }
}

class _BudgetExpensePlanView
    extends WidgetView<BudgetExpensePlanScreen, _BudgetExpensePlanScreenState> {
  _BudgetExpensePlanView(_BudgetExpensePlanScreenState state) : super(state);

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
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24.sp),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp) +
                          EdgeInsets.only(right: 92.sp),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'What are you creating an Income plan for?',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    SizedBox(height: 9.sp),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp) +
                          EdgeInsets.only(right: 50.sp),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'It Could be Monthly Expense, Car Purchase, Building Expenses, a Project Expenses or an Income Plan',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: MounaeColors.greyDescriptionColor),
                      ),
                    ),
                    SizedBox(height: 72.sp),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'E.g Car Purchase',
                          labelText: 'Budget Title',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.sp),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: state.onContinueButtonPressed,
                    child: Text('Continue')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
