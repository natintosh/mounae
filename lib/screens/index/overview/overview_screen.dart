import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/Screens/index/overview/widgets/assets_card.dart';
import 'package:mounae/Screens/index/overview/widgets/bank_balance_card.dart';
import 'package:mounae/Screens/index/overview/widgets/budgeting_card.dart';
import 'package:mounae/Screens/index/overview/widgets/financial_health_card.dart';
import 'package:mounae/Screens/index/overview/widgets/investment_portfolio_card.dart';
import 'package:mounae/Screens/index/overview/widgets/savings_card.dart';
import 'package:mounae/Screens/index/overview/widgets/transactions_card.dart';
import 'package:mounae/providers/auth_provider.dart';
import 'package:mounae/providers/user_provider.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatefulWidget {
  static const String path = '/index/overview';

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return _OverScreenView(this);
  }

  @override
  void initState() {
    super.initState();
    loadBankAccount();
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  void onFinancialHealthCardTapped() {
    AppRouterDelegate.of(context).push(FinanceConfiguration());
  }

  void onBankBalanceCardTapped() {
    AppRouterDelegate.of(context).push(AccountConfiguration());
  }

  void onBudgetingCardTapped() {
    AppRouterDelegate.of(context).push(BudgetConfiguration());
  }

  void loadBankAccount() {
    context.read<UserProvider>().getListOfBank({"username": "08139755032"});
  }
}

class _OverScreenView extends WidgetView<OverviewScreen, _OverviewScreenState> {
  _OverScreenView(_OverviewScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
                    BankBalanceCard(
                      onTap: state.onBankBalanceCardTapped,
                    ),
                    SizedBox(height: 16.sp),
                    SavingsCard(),
                    SizedBox(height: 16.sp),
                    TransactionsCard(),
                    SizedBox(height: 16.sp),
                    BudgetingCard(
                      onTap: state.onBudgetingCardTapped,
                    ),
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
