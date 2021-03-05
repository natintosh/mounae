import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/pages/index/finance/finance/finance_tab_bar_sliver_delegate.dart';
import 'package:mounae/pages/index/finance/finance/widgets/credit_score_card.dart';
import 'package:mounae/pages/index/finance/finance/widgets/frequent_expense_card.dart';
import 'package:mounae/pages/index/finance/finance/widgets/frequent_income_card.dart';
import 'package:mounae/pages/index/finance/finance/widgets/largest_transaction_card.dart';
import 'package:mounae/pages/index/finance/finance/widgets/savings_card.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class FinancePage extends StatefulWidget {
  static const String path = '/index/finance';

  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _FinancePageView(this);
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  int selectedItem = 0;

  void onFinanceFilterDateButtonPressed() {}

  void onTabSelected(int value) {
    setState(() {
      selectedItem = value;
    });
  }

  void onStartSavingButtonPressed() {}
}

class _FinancePageView extends WidgetView<FinancePage, _FinancePageState> {
  _FinancePageView(_FinancePageState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MounaeColors.greySurfaceColor,
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Finance'),
                leading: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 40.sp,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                expandedHeight: 337.sp,
                automaticallyImplyLeading: false,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 110.sp),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: 150.sp,
                                  height: 150.sp,
                                  color: Colors.black12,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Spendable Income:',
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                            color: MounaeColors
                                                .greyDescriptionColor,
                                          ),
                                    ),
                                    Text('N400,000',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                    SizedBox(height: 20.sp),
                                    Text(
                                      'Assets:',
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                            color: MounaeColors
                                                .greyDescriptionColor,
                                          ),
                                    ),
                                    Text('N400,000',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.sp),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton.icon(
                            onPressed: state.onFinanceFilterDateButtonPressed,
                            icon: Icon(Icons.date_range),
                            label: Text('23 My 2020 - Present'),
                            style: Theme.of(context)
                                .textButtonTheme
                                .style
                                .copyWith(
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                          Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText2),
                                ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 14.sp),
              ),
              SliverPersistentHeader(
                delegate: FinanceTabBarSliverDelegate(
                  height: 45.sp,
                  onTabSelected: state.onTabSelected,
                  selectedItem: state.selectedItem,
                ),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 2.sp),
              ),
            ];
          },
          body: Container(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: state.selectedItem == 0
                  ? Container(
                      child: ListView(
                        padding:
                            EdgeInsets.zero + EdgeInsets.only(bottom: 48.sp),
                        children: [
                          SavingsCard(
                            onStartSavingsButtonPressed:
                                state.onStartSavingButtonPressed,
                          ),
                          SizedBox(height: 16.sp),
                          CreditScoreCard(),
                        ],
                      ),
                    )
                  : state.selectedItem == 1
                      ? Container(
                          child: ListView(
                            padding: EdgeInsets.zero +
                                EdgeInsets.only(bottom: 48.sp),
                            children: [
                              FrequentExpenseCard(),
                              SizedBox(height: 16.sp),
                              FrequentIncomeCard(),
                              SizedBox(height: 16.sp),
                              LargestTransactionCard(),
                            ],
                          ),
                        )
                      : Container(
                          child: GridView.builder(
                              padding: EdgeInsets.symmetric(
                                vertical: 24.sp,
                                horizontal: 17.sp,
                              ),
                              itemCount: 8,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 17.sp,
                                      crossAxisSpacing: 17.sp,
                                      childAspectRatio: 136.sp / 75.sp),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 135.sp,
                                  height: 75.sp,
                                  child: Card(
                                    elevation: 0,
                                    margin: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAlias,
                                    color: MounaeColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 14.sp, horizontal: 8.sp),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Income',
                                              style: Theme.of(context)
                                                  .accentTextTheme
                                                  .caption,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'N200,000',
                                              style: Theme.of(context)
                                                  .accentTextTheme
                                                  .subtitle1,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
