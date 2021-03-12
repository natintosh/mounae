import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/models/budget_model.dart';
import 'package:mounae/providers/budget_provider.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/budget_details/add_expense_sliver_delegate.dart';
import 'package:mounae/utils/formatter/converter_utils.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class BudgetExpenseBudgetDetailsScreen extends StatefulWidget {
  static const String path = '/index/budget/expense/details';

  @override
  _BudgetExpenseBudgetDetailsScreenState createState() =>
      _BudgetExpenseBudgetDetailsScreenState();
}

class _BudgetExpenseBudgetDetailsScreenState
    extends State<BudgetExpenseBudgetDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetExpenseBudgetDetailsView(this);
  }

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  void onAppBarBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void onAddBudgetHeaderTapped() {
    AppRouterDelegate.of(context)
        .push(BudgetExpenseCreateBudgetConfiguration());
  }
}

class _BudgetExpenseBudgetDetailsView extends WidgetView<
    BudgetExpenseBudgetDetailsScreen, _BudgetExpenseBudgetDetailsScreenState> {
  _BudgetExpenseBudgetDetailsView(_BudgetExpenseBudgetDetailsScreenState state)
      : super(state);

  @override
  Widget build(BuildContext context) {
    BudgetModel budget = context.watch<BudgetProvider>().selectedBudget;
    return Scaffold(
      backgroundColor: MounaeColors.greySurfaceColor,
      extendBody: true,
      body: NestedScrollView(
        key: state.nestedScrollKey,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('Budget'),
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 40.sp,
                ),
                onPressed: state.onAppBarBackButtonPressed,
              ),
              automaticallyImplyLeading: false,
              forceElevated: innerBoxIsScrolled,
              pinned: true,
              floating: true,
              expandedHeight: 272.sp,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(16.sp),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                budget.budgetTitle,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                'N ${ConvertUtils.amount(double.parse(budget.bugetAmount))}',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              SizedBox(height: 10.sp),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5.sp),
                                    decoration: ShapeDecoration(
                                      shape: CircleBorder(),
                                      color:
                                          MounaeColors.purpleProgressMajorColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.0.sp),
                                    child: Text(
                                      'Expense',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            color: MounaeColors
                                                .purpleProgressMajorColor,
                                          ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12.sp,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.sp),
                                    decoration: ShapeDecoration(
                                      shape: CircleBorder(),
                                      color:
                                          MounaeColors.purpleProgressMinorColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.0.sp),
                                    child: Text(
                                      'Balance',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(
                                            color: MounaeColors
                                                .purpleProgressMinorColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.sp),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Budget Overview: 0%',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                              SizedBox(height: 8.sp),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      height: 16.sp,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(32.sp),
                                                bottomLeft: Radius.circular(
                                                  32.sp,
                                                ))),
                                        color: MounaeColors
                                            .purpleProgressMajorColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 100,
                                    child: Container(
                                      height: 16.sp,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(32.sp),
                                                bottomRight: Radius.circular(
                                                  32.sp,
                                                ))),
                                        color: MounaeColors
                                            .purpleProgressMinorColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.sp),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'N 0.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: MounaeColors
                                              .purpleProgressMajorColor,
                                        ),
                                  ),
                                  Text(
                                    'N ${ConvertUtils.amount(double.parse(budget.bugetAmount))}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                          color: MounaeColors
                                              .purpleProgressMinorColor,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 12.sp),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: AddExpenseSliverDelegate(
                  title: 'Create Expense',
                  subTitle:
                      'Add items you plan to spend on for this budget plan',
                  height: 106.sp,
                  onTap: state.onAddBudgetHeaderTapped,
                ),
              ),
            ),
          ];
        },
        body: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          child: ListView.separated(
            padding: EdgeInsets.only(top: 1.sp, bottom: 42.sp),
            itemCount: 10,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Transportation: 70%'),
                    ),
                    SizedBox(height: 5.sp),
                    Container(
                      height: 16.sp,
                      width: double.infinity,
                      color: Colors.black12,
                    ),
                    SizedBox(height: 5.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'N 150,000',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: MounaeColors.purpleProgressMajorColor,
                              ),
                        ),
                        Text(
                          'N 150,000',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: MounaeColors.purpleProgressMinorColor,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
