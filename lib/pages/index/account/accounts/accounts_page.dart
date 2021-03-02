import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/pages/index/account/accounts/add_account_sliver_delegate.dart';
import 'package:mounae/pages/index/account/bank_feature/bank_feature_page.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class AccountsPage extends StatefulWidget {
  static const String path = '/index/account';

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    return _AccountsPageView(this);
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  void onBackAccountCardTapped() {}

  void onAddBankAccountHeaderTapped() {
    Navigator.of(context).pushNamed(AccountBankFeaturePage.path);
  }
}

class _AccountsPageView extends WidgetView<AccountsPage, _AccountsPageState> {
  _AccountsPageView(_AccountsPageState state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MounaeColors.greySurfaceColor,
      body: Container(
        child: NestedScrollView(
          key: state.nestedScrollKey,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: Text(
                    'Accounts',
                    style: Theme.of(context)
                        .appBarTheme
                        .textTheme
                        .headline6
                        .copyWith(color: MounaeColors.primaryTextColor),
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      size: 40.sp,
                      color: MounaeColors.primaryTextColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
                                    'N600,000.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                          color: MounaeColors.primaryTextColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Total Amount Balance',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
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
              ),
            ];
          },
          body: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverPadding(
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
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8.sp),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: InkWell(
                              onTap: state.onBackAccountCardTapped,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.sp, horizontal: 18.sp),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 17.sp,
                                          height: 17.sp,
                                          color: Colors.black12,
                                        ),
                                        SizedBox(
                                          width: 10.sp,
                                        ),
                                        Text(
                                          'Bank Name LLC',
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
                                          vertical: 12.sp, horizontal: 18.sp),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'N600,000.00',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                          Text(
                                            'Current Account',
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
                      childCount: 40,
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
