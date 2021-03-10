import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/budget/create_budget_plan/widgets/plan_card.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetCreateBudgetPlanScreen extends StatefulWidget {
  static const String path = '/index/budget/create-budget-plan';

  @override
  _BudgetCreateBudgetPlanScreenState createState() =>
      _BudgetCreateBudgetPlanScreenState();
}

class _BudgetCreateBudgetPlanScreenState
    extends State<BudgetCreateBudgetPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetCreateBudgetPlanView(this);
  }

  void onAppBarBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void onExpensePlanCardTapped() {
    AppRouterDelegate.of(context).push(BudgetExpensePlanConfiguration());
  }

  void onIncomePlanCardTapped() {
    AppRouterDelegate.of(context).push(BudgetExpensePlanConfiguration());
  }
}

class _BudgetCreateBudgetPlanView extends WidgetView<
    BudgetCreateBudgetPlanScreen, _BudgetCreateBudgetPlanScreenState> {
  _BudgetCreateBudgetPlanView(_BudgetCreateBudgetPlanScreenState state)
      : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Budget Plan'),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.sp,
          ),
          onPressed: state.onAppBarBackButtonPressed,
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
                  'What kind of budget plan are you Creating?',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: 92.sp),
              PlanCard(
                title: 'Income Plan',
                subtitle:
                    'It could be money you plan to earn from a project, delivering a service working or selling a product for a particular period of time',
                color: MounaeColors.createBudgetIncomePlanColor,
                onTap: state.onIncomePlanCardTapped,
              ),
              SizedBox(height: 32.sp),
              PlanCard(
                title: 'Expense Plan',
                subtitle:
                    'It could be Monthly Expense, Car Purchase plan, Building Expense plan or a Project Expense plan',
                color: MounaeColors.createBudgetExpensePlanColor,
                onTap: state.onExpensePlanCardTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
