import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/pages/index/account/bank_account/transaction_history_sliver_delegate.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:mounae/utils/widget_view/widget_view.dart';

class AccountBankAccountPage extends StatefulWidget {
  static const String path = '/index/account/bank-account';

  @override
  _AccountBankAccountPageState createState() => _AccountBankAccountPageState();
}

class _AccountBankAccountPageState extends State<AccountBankAccountPage> {
  @override
  Widget build(BuildContext context) {
    return _AccountBankAccountView(this);
  }

  final GlobalKey<NestedScrollViewState> nestedScrollKey =
      GlobalKey<NestedScrollViewState>();

  void onFilterButtonTapped() {}

  void onTransactionListItemTapped() {}
}

class _AccountBankAccountView
    extends WidgetView<AccountBankAccountPage, _AccountBankAccountPageState> {
  _AccountBankAccountView(_AccountBankAccountPageState state) : super(state);

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
                leading: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 40.sp,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                expandedHeight: 220.sp,
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
                          child: Container(
                            padding: EdgeInsets.all(16.sp),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 67.sp,
                                  height: 67.sp,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  height: 2.sp,
                                ),
                                Text(
                                  'Bank Name LLC',
                                  style: Theme.of(context).textTheme.bodyText2,
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 16.sp,
                              bottom: 42.sp,
                              left: 16.sp,
                              right: 16.sp + 67.sp + 16.sp,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'N600,000.00',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  'Total Amount Balance',
                                  style: Theme.of(context).textTheme.bodyText2,
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
              SliverToBoxAdapter(
                child: SizedBox(height: 16.sp),
              ),
              SliverPersistentHeader(
                delegate: TransactionHistorySliverDelegate(
                  currentFilterMode: 'Weekly',
                  height: 60.sp,
                  onFilterButtonTapped: state.onFilterButtonTapped,
                ),
                pinned: true,
              ),
            ];
          },
          body: Builder(
            builder: (context) {
              return Container(
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  child: ListView.separated(
                    itemCount: 44,
                    separatorBuilder: (context, index) {
                      return Divider(
                        indent: 56.sp,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: state.onTransactionListItemTapped,
                        leading: Container(
                          width: 27.sp,
                          height: 27.sp,
                          color: Colors.black12,
                        ),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 8.sp),
                          child: Text('Transaction description'),
                        ),
                        subtitle: Text(
                          'Mar 25, 2021 | Unassigned',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: MounaeColors.greyDescriptionColor),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.sp),
                              child: Text('-N400,000'),
                            ),
                            Text(
                              'Debit',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: MounaeColors.greyDescriptionColor),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
