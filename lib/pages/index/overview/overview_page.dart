import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/pages/index/finance/finance/finance_page.dart';
import 'package:mounae/pages/index/overview/widgets/assets_card.dart';
import 'package:mounae/pages/index/overview/widgets/bank_balance_card.dart';
import 'package:mounae/pages/index/overview/widgets/budgeting_card.dart';
import 'package:mounae/pages/index/overview/widgets/financial_health_card.dart';
import 'package:mounae/pages/index/overview/widgets/investment_portfolio_card.dart';
import 'package:mounae/pages/index/overview/widgets/savings_card.dart';
import 'package:mounae/pages/index/overview/widgets/transactions_card.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  static const String path = '/index/overview';

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return _OverPageView(this);
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  void onFinancialHealthCardTapped() {
    Navigator.of(context).pushNamed(FinancePage.path);
  }
}

class _OverPageView extends WidgetView<OverviewPage, _OverviewPageState> {
  _OverPageView(_OverviewPageState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MounaeColors.greySurfaceColor,
      body: Container(
        child: NestedScrollView(
          key: state.nestedScrollKey,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Overview'),
                expandedHeight: 156.sp,
                automaticallyImplyLeading: false,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 16.sp,
                              bottom: 16.sp,
                              left: 27.sp,
                              right: 16.sp + 67.sp + 16.sp,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hey ${context.read<AuthProvider>().displayName ?? ''},',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                SizedBox(height: 8.sp),
                                Text(
                                  'Your financial health is fine keep shooting for the stars',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.left,
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
            ];
          },
          body: Builder(
            builder: (context) {
              return Container(
                child: ListView(
                  children: [
                    FinancialHealthCard(
                      onTap: state.onFinancialHealthCardTapped,
                    ),
                    SizedBox(height: 16.sp),
                    BankBalanceCard(),
                    SizedBox(height: 16.sp),
                    SavingsCard(),
                    SizedBox(height: 16.sp),
                    TransactionsCard(),
                    SizedBox(height: 16.sp),
                    BudgetingCard(),
                    SizedBox(height: 16.sp),
                    AssetsCard(),
                    SizedBox(height: 16.sp),
                    InvestmentPortfolioCard(),
                    Container(
                      height: 77.sp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: MounaeColors.greyDescriptionColor,
                          ),
                          Text(
                            '© Mounae 2020',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: MounaeColors.greyDescriptionColor,
                                ),
                          ),
                        ],
                      ),
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
