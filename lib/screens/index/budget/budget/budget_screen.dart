import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/budget/budget/add_budget_sliver_delegate.dart';
import 'package:mounae/screens/index/budget/budget/widgets/budget_item_card.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetScreen extends StatefulWidget {
  static const String path = '/index/budget';

  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetView(this);
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  void onAppBarBackButtonPressed() {
    AppRouterDelegate.of(context).replaceAll(IndexConfiguration());
  }

  void onAddBudgetHeaderTapped() {
    AppRouterDelegate.of(context).push(BudgetCreateBudgetPlanConfiguration());
  }
}

class _BudgetView extends WidgetView<BudgetScreen, _BudgetScreenState> {
  _BudgetView(_BudgetScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MounaeColors.greySurfaceColor,
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
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 12.sp),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: AddBudgetSliverDelegate(
                  title: 'Create a Budget Plan',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
                  height: 106.sp,
                  onTap: state.onAddBudgetHeaderTapped,
                ),
              ),
            ),
          ];
        },
        body: ListView(
          padding: EdgeInsets.only(top: 1.sp, bottom: 42.sp),
          children: [
            BudgetItemCard(
              title: 'Monthly Expense',
              primaryColor: MounaeColors.purpleProgressMajorColor,
              secondaryColor: MounaeColors.purpleProgressMinorColor,
            ),
            SizedBox(height: 8.sp),
            BudgetItemCard(
              title: 'Home Construction',
              primaryColor: MounaeColors.limeProgressMajorColor,
              secondaryColor: MounaeColors.limeProgressMinorColor,
            ),
          ],
        ),
      ),
    );
  }
}
