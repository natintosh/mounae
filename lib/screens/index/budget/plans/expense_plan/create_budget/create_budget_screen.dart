import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/budget/plans/expense_plan/create_budget/search_add_sliver_persistent_delegate.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class BudgetExpenseCreateBudgetScreen extends StatefulWidget {
  static const String path = '/index/budget/expense/create-budget';

  @override
  _BudgetExpenseCreateBudgetScreenState createState() =>
      _BudgetExpenseCreateBudgetScreenState();
}

class _BudgetExpenseCreateBudgetScreenState
    extends State<BudgetExpenseCreateBudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return _BudgetExpenseCreateBudgetView(this);
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  void onAppBarBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void onAddHeaderButtonPressed() {}

  void onExpandedListItemPressed(Map<String, String> arguments) {
    AppRouterDelegate.of(context)
        .push(BudgetExpenseCreateBudgetExpenseConfiguration(arguments));
  }
}

class _BudgetExpenseCreateBudgetView extends WidgetView<
    BudgetExpenseCreateBudgetScreen, _BudgetExpenseCreateBudgetScreenState> {
  _BudgetExpenseCreateBudgetView(_BudgetExpenseCreateBudgetScreenState state)
      : super(state);

  @override
  Widget build(BuildContext context) {
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
              expandedHeight: 210.sp,
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
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(right: 90.sp),
                                child: Text(
                                  'What are you creating a budget for?',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              SizedBox(
                                height: 12.sp,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(right: 90.sp),
                                child: Text(
                                  'Choose from predetermined or create new one',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color:
                                            MounaeColors.greyDescriptionColor,
                                      ),
                                ),
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
              padding: EdgeInsets.symmetric(vertical: 0.sp),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: SearchAddSliverPersistentDelegate(
                  height: 48.sp,
                  onAddButtonPressed: state.onAddHeaderButtonPressed,
                ),
              ),
            ),
          ];
        },
        body: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          child: Container(
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: ListView(
                children: [
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(right: 16.sp),
                    initiallyExpanded: true,
                    collapsedBackgroundColor: MounaeColors.accentColor,
                    backgroundColor: MounaeColors.accentColor,
                    title: Container(
                      padding: EdgeInsets.all(16.sp),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(),
                        color: MounaeColors.accentColor,
                      ),
                      child: Text(
                        'Home',
                        style: Theme.of(context).accentTextTheme.bodyText2,
                      ),
                    ),
                    children: [
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state
                              .onExpandedListItemPressed({"Home": "Furniture"});
                        },
                        title: Text(
                          'Furniture',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed({"Home": "Rent"});
                        },
                        title: Text(
                          'Rent',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Home": "Electric Bill"});
                        },
                        title: Text(
                          'Electric Bill',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Home": "House Repairs"});
                        },
                        title: Text(
                          'House Repairs',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Home": "Electronic Repairs"});
                        },
                        title: Text(
                          'Electronic Repairs',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(right: 16.sp),
                    initiallyExpanded: true,
                    collapsedBackgroundColor: MounaeColors.accentColor,
                    backgroundColor: MounaeColors.accentColor,
                    title: Container(
                      padding: EdgeInsets.all(16.sp),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(),
                        color: MounaeColors.accentColor,
                      ),
                      child: Text(
                        'Transportation',
                        style: Theme.of(context).accentTextTheme.bodyText2,
                      ),
                    ),
                    children: [
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Transportation": "Car Repairs"});
                        },
                        title: Text(
                          'Car Repairs',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Transportation": "Car Rent"});
                        },
                        title: Text(
                          'Car Rent',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Transportation": "Ride-Hailing"});
                        },
                        title: Text(
                          'Ride-Hailing(Uber, Taxify)',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Transportation": "BRT Bus Fare"});
                        },
                        title: Text(
                          'BRT Bus Fare',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Transportation": "Yello Bus Fare"});
                        },
                        title: Text(
                          'Yellow Bus Fare',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(right: 16.sp),
                    initiallyExpanded: true,
                    collapsedBackgroundColor: MounaeColors.accentColor,
                    backgroundColor: MounaeColors.accentColor,
                    title: Container(
                      padding: EdgeInsets.all(16.sp),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(),
                        color: MounaeColors.accentColor,
                      ),
                      child: Text(
                        'Utilities',
                        style: Theme.of(context).accentTextTheme.bodyText2,
                      ),
                    ),
                    children: [
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Utilities": "Water Bill"});
                        },
                        title: Text(
                          'Water Bill',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Utilities": "Internet Subscription"});
                        },
                        title: Text(
                          'Internet Subscription',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Utilities": "Nail and Hammers"});
                        },
                        title: Text(
                          'Nail and Hammers',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(right: 16.sp),
                    initiallyExpanded: true,
                    collapsedBackgroundColor: MounaeColors.accentColor,
                    backgroundColor: MounaeColors.accentColor,
                    title: Container(
                      padding: EdgeInsets.all(16.sp),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(),
                        color: MounaeColors.accentColor,
                      ),
                      child: Text(
                        'Family Support',
                        style: Theme.of(context).accentTextTheme.bodyText2,
                      ),
                    ),
                    children: [
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Family Support": "Sade(Cousin)"});
                        },
                        title: Text(
                          'Sade(Cousin)',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                      ListTile(
                        tileColor: Colors.white,
                        onTap: () {
                          state.onExpandedListItemPressed(
                              {"Family Support": "Aunt Lade"});
                        },
                        title: Text(
                          'Aunt Lade',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
