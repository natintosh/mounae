import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/providers/date_picker_provider.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/budget/plans/widgets/monthly_date_picker.dart';
import 'package:mounae/screens/index/budget/plans/widgets/period_grid.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class BudgetExpenseCreateBudgetBillSettingsScreen extends StatefulWidget {
  static const String path =
      '/index/budget/expense/create-budget/bill-settings';

  @override
  _BudgetExpenseCreateBudgetBillSettingsScreenState createState() =>
      _BudgetExpenseCreateBudgetBillSettingsScreenState();
}

class _BudgetExpenseCreateBudgetBillSettingsScreenState
    extends State<BudgetExpenseCreateBudgetBillSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetExpenseCreateBudgetBillSettingsView(this);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  bool automatePayment = false;

  int index;

  void onAppBarBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void onContinueButtonPressed() {
    AppRouterDelegate.of(context).pushPath([
      IndexConfiguration(),
      BudgetConfiguration(),
      BudgetExpenseBudgetDetailsConfiguration(),
    ]);
  }

  void onRepeatedItemTapped(int value) {
    setState(() {
      index = value;
    });
  }

  void onSwitchButtonChanged(bool value) {
    setState(() {
      automatePayment = value;
    });
  }
}

class _BudgetExpenseCreateBudgetBillSettingsView extends WidgetView<
    BudgetExpenseCreateBudgetBillSettingsScreen,
    _BudgetExpenseCreateBudgetBillSettingsScreenState> {
  _BudgetExpenseCreateBudgetBillSettingsView(
      _BudgetExpenseCreateBudgetBillSettingsScreenState state)
      : super(state);

  @override
  Widget build(BuildContext context) {
    List<String> arguments =
        AppRouterDelegate.of(context).currentConfiguration.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Budget'),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.sp,
          ),
          onPressed: state.onAppBarBackButtonPressed,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20.sp),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Text(
                          arguments[0],
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      SizedBox(height: 18.sp),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Text(
                          'Budget Amount',
                          style: Theme.of(context).primaryTextTheme.subtitle2,
                        ),
                      ),
                      SizedBox(height: 12.sp),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Text(
                          'N ${arguments[1]}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      SizedBox(height: 30.sp),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            color: MounaeColors.primaryColor,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.sp, vertical: 16.sp),
                          child: Text(
                            arguments[2],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: MounaeColors.primaryTextColor),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.sp),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.sp),
                        child: ListTile(
                          title: Text(
                            'Automate Expense Payment',
                            style: Theme.of(context).primaryTextTheme.subtitle2,
                          ),
                          subtitle: Text(
                            'Turn this feature on if you would like to automate payment of this expense. Perfect for Airtime, Data, DSTV/GOtv Subscription, Kids Allowance, School fees ETC',
                            style:
                                Theme.of(context).textTheme.bodyText2.copyWith(
                                      color: MounaeColors.greyDescriptionColor,
                                    ),
                          ),
                          trailing: Switch(
                            value: state.automatePayment,
                            onChanged: state.onSwitchButtonChanged,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.sp),
                      state.automatePayment
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MonthlyDatePicker(
                                  focusedDate: context
                                      .read<DatePickerProvider>()
                                      .focusedDate,
                                  onDaySelected: context
                                      .read<DatePickerProvider>()
                                      .onMonthlyDatePickerDaySelected,
                                  selectedDayPredicate: context
                                      .read<DatePickerProvider>()
                                      .selectedDayPredicate,
                                  selectedDate: context
                                      .read<DatePickerProvider>()
                                      .selectedDate,
                                  lastDate: context
                                      .read<DatePickerProvider>()
                                      .lastDayOfYear,
                                  singleMonthSelection: false,
                                  fistDate: context
                                      .read<DatePickerProvider>()
                                      .firstDayOfYear,
                                  title: 'Payment Date',
                                ),
                                SizedBox(height: 24.sp),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.sp),
                                  child: Text(
                                    'Would you like to repeat this payment every "month"?',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .subtitle2,
                                  ),
                                ),
                                SizedBox(height: 24.sp),
                                PeriodGrid(
                                  index: state.index,
                                  items: ['Yes', 'No'],
                                  onTap: state.onRepeatedItemTapped,
                                ),
                                SizedBox(
                                  height: 24.sp,
                                ),
                              ],
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(16.sp),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state.onContinueButtonPressed,
                    child: Text('Continue'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
