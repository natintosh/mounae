import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/budget/plans/widgets/icon_plan_card.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetExpenseChoosePlanTypeScreen extends StatefulWidget {
  static const String path = '/index/budget/expense/create-plan/choose-plan';

  @override
  _BudgetExpenseChoosePlanTypeScreenState createState() =>
      _BudgetExpenseChoosePlanTypeScreenState();
}

class _BudgetExpenseChoosePlanTypeScreenState
    extends State<BudgetExpenseChoosePlanTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetExpenseChoosePlanTypeView(this);
  }

  void onPeriodicCardTapped() {
    AppRouterDelegate.of(context)
        .push(BudgetExpensePeriodicPlanConfiguration());
  }
}

class _BudgetExpenseChoosePlanTypeView extends WidgetView<
    BudgetExpenseChoosePlanTypeScreen,
    _BudgetExpenseChoosePlanTypeScreenState> {
  _BudgetExpenseChoosePlanTypeView(
      _BudgetExpenseChoosePlanTypeScreenState state)
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.sp),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.sp) +
                    EdgeInsets.only(right: 72.sp),
                child: Text(
                  'Great! 🦾\nIs this a ‘Periodic’ or ‘One-Time Budget’?',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: 52.sp),
              IconPlanCard(
                title: 'Periodic',
                subtitle:
                    'Save a predetermined amount weekly, Bi-Monthly or Monthly till you get to your target',
                color: MounaeColors.periodPlanColor,
                assetName: 'assets/svg/periodic.svg',
                onTap: state.onPeriodicCardTapped,
              ),
              SizedBox(height: 24.sp),
              IconPlanCard(
                title: 'One-Time',
                subtitle:
                    'Fund amount at ones and lock for a set period of time with the ability to add more anytime ',
                color: MounaeColors.onTimePlanColor,
                assetName: 'assets/svg/one_time.svg',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
