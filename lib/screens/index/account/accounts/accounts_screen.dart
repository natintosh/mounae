import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mounae/models/account_model.dart';
import 'package:mounae/models/bank_list_model.dart';
import 'package:mounae/providers/user_provider.dart';
import 'package:mounae/routes/app_router_delegate.dart';
import 'package:mounae/routes/page_configuration.dart';
import 'package:mounae/screens/index/account/accounts/add_account_sliver_delegate.dart';
import 'package:mounae/utils/formatter/converter_utils.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';
import 'package:provider/provider.dart';

class AccountsScreen extends StatefulWidget {
  static const String path = '/index/accounts';

  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return _AccountsScreenView(this);
  }

  @override
  void initState() {
    loadBankAccount();
    super.initState();
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  void onBankAccountCardTapped() {
    AppRouterDelegate.of(context).push(AccountBankAccountConfiguration());
  }

  void onAddBankAccountHeaderTapped() {
    AppRouterDelegate.of(context).push(AccountBankFeatureConfiguration());
  }

  void onBackAppBarButtonPressed() {
    AppRouterDelegate.of(context).replaceAll(IndexConfiguration());
  }

  void loadBankAccount() {
    context.read<UserProvider>().getListOfBank({"username": "08139755032"});
  }
}

class _AccountsScreenView
    extends WidgetView<AccountsScreen, _AccountsScreenState> {
  _AccountsScreenView(_AccountsScreenState state) : super(state);

  @override
  Widget build(BuildContext context) {
    BankListModel? bankList = context.watch<UserProvider>().bankList;
    String totalBalance =
        NumberFormat('#,##0.00').format(bankList?.totalBalance ?? 0);
    return Scaffold(
      backgroundColor: MounaeColors.greySurfaceColor,
      body: Container(
        child: NestedScrollView(
          key: state.nestedScrollKey,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text(
                  'Accounts',
                  style: Theme.of(context)
                      .appBarTheme
                      .textTheme!
                      .headline6!
                      .copyWith(color: MounaeColors.primaryTextColor),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 40.sp,
                    color: MounaeColors.primaryTextColor,
                  ),
                  onPressed: state.onBackAppBarButtonPressed,
                ),
                expandedHeight: 202.sp,
                backgroundColor: MounaeColors.primaryColor,
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
                          alignment: Alignment.bottomRight,
                          child: Opacity(
                            opacity: 0.6,
                            child: SvgPicture.asset(
                              'assets/svg/bank_building.svg',
                              width: 100.sp,
                              height: 68.sp,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.all(16.sp),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'N $totalBalance',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: MounaeColors.primaryTextColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  'Total Amount Balance',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: MounaeColors.primaryTextColor,
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
              bankList == null
                  ? SliverToBoxAdapter(child: Container())
                  : (bankList.accounts?.isEmpty ?? [].isEmpty)
                      ? SliverToBoxAdapter(child: Container())
                      : SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 16.sp),
                          sliver: SliverPersistentHeader(
                            pinned: true,
                            delegate: AddAccountSliverDelegate(
                                title: 'Add Bank Account',
                                subTitle:
                                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
                                height: 106.sp,
                                onTap: state.onAddBankAccountHeaderTapped),
                          ),
                        ),
            ];
          },
          body: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  bankList == null
                      ? SliverToBoxAdapter(child: Container())
                      : bankList.accounts!.isEmpty
                          ? SliverToBoxAdapter(
                              child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(height: 94.sp),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 42.sp,
                                        height: 42.sp,
                                        child: SvgPicture.asset(
                                            'assets/svg/bank_icon.svg'),
                                      ),
                                    ),
                                    SizedBox(height: 24.sp),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 94.sp),
                                        child: Text(
                                          'Your bank account is not yet connected',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24.sp),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.sp),
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: state
                                              .onAddBankAccountHeaderTapped,
                                          child: Text(
                                            'Add a Bank Account',
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  BankAccount account =
                                      bankList.accounts![index];
                                  return Container(
                                    padding: EdgeInsets.all(8.sp),
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: EdgeInsets.zero,
                                      child: InkWell(
                                        onTap: state.onBankAccountCardTapped,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.sp,
                                                  horizontal: 18.sp),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 17.sp,
                                                    height: 17.sp,
                                                    child: SvgPicture.network(
                                                      account.logo ?? '',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.sp,
                                                  ),
                                                  Text(
                                                    account.bankName!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12.sp,
                                                    horizontal: 18.sp),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'N ${ConvertUtils.amount(double.parse(account.availableBalance ?? '0'))}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline5,
                                                    ),
                                                    Text(
                                                      'SA' == 'SA'
                                                          ? 'Savings Account'
                                                          : 'Current Account',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 18.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                childCount: bankList.accounts?.length ?? 0,
                              ),
                            )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
