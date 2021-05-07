import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/budget/plans/widgets/period_grid.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetExpenseCreateBudgetExpenseScreen extends StatefulWidget {
  static const String path = '/index/budget/expense/create-budget/expense';

  @override
  _BudgetExpenseCreateBudgetExpenseScreenState createState() =>
      _BudgetExpenseCreateBudgetExpenseScreenState();
}

class _BudgetExpenseCreateBudgetExpenseScreenState
    extends State<BudgetExpenseCreateBudgetExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetExpenseCreateBudgetExpenseView(this);
  }

  @override
  void initState() {
    focusNode = FocusNode()
      ..addListener(() {
        if (focusNode!.hasFocus || controller!.text.isNotEmpty) {
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPrefixText = false;

  TextEditingController? controller;
  FocusNode? focusNode;

  int index = 0;

  final List<String> periods = [
    'Daily',
    'Bi-Weekly',
    'Weekly',
    'Bi-Monthly',
    'Monthly',
  ];

  void onAppBarBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void onContinueButtonPressed() {
    if (formKey.currentState!.validate()) {
      String plan = (AppRouterDelegate.of(context)
              .currentConfiguration!
              .arguments as Map<String, String>)
          .values
          .toList()[0];
      String amount = controller!.text;
      String period = periods[index];
      AppRouterDelegate.of(context).push(
        BudgetExpenseCreateBudgetBillSettingsConfiguration(
          [plan, amount, period],
        ),
      );
    }
  }

  void onPeriodGridTapped(int value) {
    setState(() {
      index = value;
    });
  }
}

class _BudgetExpenseCreateBudgetExpenseView extends WidgetView<
    BudgetExpenseCreateBudgetExpenseScreen,
    _BudgetExpenseCreateBudgetExpenseScreenState> {
  _BudgetExpenseCreateBudgetExpenseView(
      _BudgetExpenseCreateBudgetExpenseScreenState state)
      : super(state);

  @override
  Widget build(BuildContext context) {
    Map<String, String> arguments =
        AppRouterDelegate.of(context).currentConfiguration!.arguments as Map<String, String>;
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
      body: Form(
        key: state.formKey,
        child: Container(
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
                            arguments.keys.toList()[0],
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        SizedBox(height: 12.sp),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Text(
                            arguments.values.toList()[0],
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: MounaeColors.greyDescriptionColor,
                                    ),
                          ),
                        ),
                        SizedBox(height: 24.sp),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: TextFormField(
                            controller: state.controller,
                            focusNode: state.focusNode,
                            keyboardType: TextInputType.number,
                            showCursor: true,
                            enableInteractiveSelection: false,
                            textAlign: TextAlign.start,
                            inputFormatters: [
                              CurrencyTextInputFormatter(
                                  symbol: '', customPattern: '#,##0.00'),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[\d\.\,]'))
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Amount is Empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixText: state.showPrefixText ? 'N ' : null,
                              hintText:
                                  '${!state.showPrefixText ? 'N ' : ''}0.00',
                              labelText: 'Enter Budget Amount',
                            ),
                          ),
                        ),
                        SizedBox(height: 30.sp),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 16.sp) +
                              EdgeInsets.only(right: 94.sp),
                          child: Text(
                            'How often would you use this Budget?',
                            style: Theme.of(context).primaryTextTheme.subtitle2,
                          ),
                        ),
                        SizedBox(height: 12.sp),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Text.rich(
                            TextSpan(
                              text: 'Click “',
                              children: [
                                TextSpan(
                                  text: 'Continue',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                                TextSpan(text: '” if you’re not sure of this'),
                              ],
                            ),
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: MounaeColors.greyDescriptionColor,
                                    ),
                          ),
                        ),
                        SizedBox(height: 24.sp),
                        PeriodGrid(
                          index: state.index,
                          items: state.periods,
                          onTap: state.onPeriodGridTapped,
                        )
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
      ),
    );
  }
}
