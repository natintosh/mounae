import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/providers/date_picker_provider.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/budget/plans/widgets/monthly_date_picker.dart';
import 'package:mounae/screens/index/budget/plans/widgets/period_grid.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class BudgetExpensePeriodicPlanScreen extends StatefulWidget {
  static const String path = '/index/budget/create-budget-plan/expense-plan';

  @override
  _BudgetExpensePeriodicPlanScreenState createState() =>
      _BudgetExpensePeriodicPlanScreenState();
}

class _BudgetExpensePeriodicPlanScreenState
    extends State<BudgetExpensePeriodicPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetExpensePeriodicPlanView(this);
  }

  int index;

  void onPeriodGridTapped(int value) {
    setState(() {
      index = index == value ? null : value;
    });

    context.read<DatePickerProvider>().reset();
    context.read<DatePickerProvider>().singleDateSelection = (value != 2);
    context.read<DatePickerProvider>().singleMonthSelection =
        (value == 1 || value == 2);
  }

  void onDayGridTapped(int value) {
    context.read<DatePickerProvider>().dayIndex = value;
  }

  void onContinueButtonPressed() {
    AppRouterDelegate.of(context)
        .push(BudgetExpenseBudgetDetailsConfiguration());
  }
}

class _BudgetExpensePeriodicPlanView extends WidgetView<
    BudgetExpensePeriodicPlanScreen, _BudgetExpensePeriodicPlanScreenState> {
  _BudgetExpensePeriodicPlanView(_BudgetExpensePeriodicPlanScreenState state)
      : super(state);

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
                    SizedBox(height: 20.sp),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'More Information👀',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    SizedBox(height: 24.sp),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Budget Period?',
                        style: Theme.of(context).primaryTextTheme.subtitle2,
                      ),
                    ),
                    SizedBox(height: 24.sp),
                    PeriodGrid(
                      index: state.index,
                      items: [
                        'Weekly',
                        'Monthly',
                        'Bi-Monthly',
                        'Quarterly',
                        'Bi-Yearly',
                        'Yearly',
                      ],
                      onTap: state.onPeriodGridTapped,
                    ),
                    SizedBox(height: 48.sp),
                    state.index == 0
                        ? Column(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 16.sp) +
                                        EdgeInsets.only(right: 120.sp),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'What day of the week should your plan begin?',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle2,
                                ),
                              ),
                              SizedBox(height: 24.sp),
                              PeriodGrid(
                                index: context
                                    .watch<DatePickerProvider>()
                                    .dayIndex,
                                items: [
                                  'Monday',
                                  'Tuesday',
                                  'Wednesday',
                                  'Thursday',
                                  'Friday',
                                  'Saturday',
                                  'Sunday',
                                ],
                                onTap: state.onDayGridTapped,
                              ),
                            ],
                          )
                        : state.index != null
                            ? MonthlyDatePicker(
                                key: ValueKey(state.index),
                                title: state.index == 1
                                    ? 'What day of the month should your plan begin?'
                                    : state.index == 2
                                        ? 'What two day of the month should your plan begin?'
                                        : 'What month and day should your plan begin?',
                                focusedDate: context
                                    .watch<DatePickerProvider>()
                                    .focusedDate,
                                selectedDate: context
                                    .watch<DatePickerProvider>()
                                    .selectedDate,
                                fistDate: context
                                        .watch<DatePickerProvider>()
                                        .singleMonthSelection
                                    ? context
                                        .watch<DatePickerProvider>()
                                        .firstDayOfMonth
                                    : context
                                        .watch<DatePickerProvider>()
                                        .firstDayOfYear,
                                lastDate: context
                                        .watch<DatePickerProvider>()
                                        .singleMonthSelection
                                    ? context
                                        .watch<DatePickerProvider>()
                                        .lastDayOfMonth
                                    : context
                                        .watch<DatePickerProvider>()
                                        .lastDayOfYear,
                                onDaySelected: context
                                    .watch<DatePickerProvider>()
                                    .onMonthlyDatePickerDaySelected,
                                selectedDayPredicate: context
                                    .watch<DatePickerProvider>()
                                    .selectedDayPredicate,
                                singleMonthSelection: context
                                    .watch<DatePickerProvider>()
                                    .singleMonthSelection,
                              )
                            : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            state.index != null
                ? Container(
                    padding: EdgeInsets.all(16.sp),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.onContinueButtonPressed,
                        child: Text('Create a Budget Plan'),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
