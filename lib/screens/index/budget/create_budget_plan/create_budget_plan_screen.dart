import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class CreateBudgetPlanScreen extends StatefulWidget {
  static const String path = '/index/budget/create-budget-plan';

  @override
  _CreateBudgetPlanScreenState createState() => _CreateBudgetPlanScreenState();
}

class _CreateBudgetPlanScreenState extends State<CreateBudgetPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return _CreateBudgetPlanView(this);
  }

  void onAppBarBackButtonPressed() {
    Navigator.of(context).pop();
  }
}

class _CreateBudgetPlanView
    extends WidgetView<CreateBudgetPlanScreen, _CreateBudgetPlanScreenState> {
  _CreateBudgetPlanView(_CreateBudgetPlanScreenState state) : super(state);

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
              ),
              SizedBox(height: 32.sp),
              PlanCard(
                title: 'Expense Plan',
                subtitle:
                    'It could be Monthly Expense, Car Purchase plan, Building Expense plan or a Project Expense plan',
                color: MounaeColors.createBudgetExpensePlanColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const PlanCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        color: color,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.sp,
            vertical: 24.sp,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: MounaeColors.primaryTextColor,
                      ),
                ),
              ),
              SizedBox(height: 8.sp),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(right: 72.sp),
                child: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: MounaeColors.primaryTextColor,
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
