import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetIncomeAmountScreen extends StatefulWidget {
  static const String path = '/index/budget/create-budget-plan/income-amount';

  @override
  _BudgetIncomeAmountScreenState createState() =>
      _BudgetIncomeAmountScreenState();
}

class _BudgetIncomeAmountScreenState extends State<BudgetIncomeAmountScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetIncomeAmountView(this);
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

  void onContinueButtonPressed() {
    AppRouterDelegate.of(context).push(BudgetIncomeChoosePlanConfiguration());
  }
}

class _BudgetIncomeAmountView extends WidgetView<BudgetIncomeAmountScreen,
    _BudgetIncomeAmountScreenState> {
  _BudgetIncomeAmountView(_BudgetIncomeAmountScreenState state) : super(state);

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
                        'What is the total amount you plan to Earn for “Monthly Income”',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    SizedBox(height: 80.sp),
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
                          FilteringTextInputFormatter.allow(RegExp(r'[\d\.\,]'))
                        ],
                        decoration: InputDecoration(
                          prefixText: state.showPrefixText ? 'N ' : null,
                          hintText: '${!state.showPrefixText ? 'N ' : ''}0.00',
                          labelText: 'Enter Amount',
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: Text.rich(
                        TextSpan(text: 'Click "', children: [
                          TextSpan(
                            text: 'Conitnue',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: MounaeColors.primaryColor),
                          ),
                          TextSpan(
                            text: '" if you are not sure',
                          ),
                        ]),
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: MounaeColors.lightPurpleDescriptiveColor),
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
