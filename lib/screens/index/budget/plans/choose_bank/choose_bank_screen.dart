import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetPlanChooseBankSheet extends StatefulWidget {
  final ScrollController scrollController;
  final VoidCallback onAddAccountButtonPressed;

  const BudgetPlanChooseBankSheet(
      {Key? key,
      required this.scrollController,
      required this.onAddAccountButtonPressed})
      : super(key: key);

  @override
  _BudgetPlanChooseBankSheetState createState() =>
      _BudgetPlanChooseBankSheetState();
}

class _BudgetPlanChooseBankSheetState extends State<BudgetPlanChooseBankSheet> {
  @override
  Widget build(BuildContext context) {
    return _BudgetChooseBankView(this);
  }

  int? index;

  void onBackAccountSelected(int value) {
    setState(() {
      index = value;
    });
  }

  void onContinueButtonPressed() {
    widget.onAddAccountButtonPressed();
  }
}

class _BudgetChooseBankView extends WidgetView<BudgetPlanChooseBankSheet,
    _BudgetPlanChooseBankSheetState> {
  _BudgetChooseBankView(_BudgetPlanChooseBankSheetState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 48.sp, vertical: 24.sp),
            child: Text(
              'Which of these bank account should be monitored for this plan',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.subtitle2,
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                controller: widget.scrollController,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          state.onBackAccountSelected(index);
                        },
                        child: Container(
                          padding: EdgeInsets.all(18.sp),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(9),
                                          color: Colors.black12,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Bank Name LLC',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'N 200,000',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Current Account',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: MounaeColors
                                                  .greyDescriptionColor,
                                            ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.check_circle,
                                  color: state.index == index
                                      ? MounaeColors.primaryColor
                                      : Colors.black12,
                                ),
                                onPressed: () {
                                  state.onBackAccountSelected(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.sp),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: state.onContinueButtonPressed,
                  child: Text('Add Account')),
            ),
          ),
        ],
      ),
    );
  }
}
