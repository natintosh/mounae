import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/models/account_model.dart';
import 'package:mounae/models/bank_list_model.dart';
import 'package:mounae/providers/user_provider.dart';
import 'package:mounae/utils/formatter/converter_utils.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';
import 'package:provider/provider.dart';

class BankBalanceCard extends StatelessWidget {
  const BankBalanceCard({
    Key key,
    @required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    BankListModel bankList = context.watch<UserProvider>().bankList;
    String totalBalance = ConvertUtils.amount(bankList?.totalBalance ?? 0);
    return Container(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        color: MounaeColors.primaryColor,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 230.sp,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                    opacity: 0.4,
                    child: SvgPicture.asset(
                      'assets/svg/bank_building_right.svg',
                      height: 68.sp,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.bottomLeft,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Bank Balance',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: MounaeColors.primaryTextColor),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: MounaeColors.primaryTextColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 2.sp),
                      Container(
                        padding: EdgeInsets.only(right: 84.sp),
                        child: Text(
                          'This is the available balance you have in all added ban accounts',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: MounaeColors.primaryTextColor,
                              ),
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Container(
                        padding: EdgeInsets.only(right: 84.sp),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'N $totalBalance',
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      color: MounaeColors.primaryTextColor,
                                    ),
                          ),
                        ),
                      ),
                      SizedBox(height: 9.sp),
                      Container(
                        height: 24.sp,
                        alignment: Alignment.centerLeft,
                        child: bankList == null
                            ? Container()
                            : ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: bankList?.accounts?.length ?? 0,
                                itemBuilder: (context, index) {
                                  BankAccount account =
                                      bankList.accounts[index];
                                  String amount = ConvertUtils.amount(
                                      (double.parse(
                                          account?.availableBalance ?? '0')));
                                  return Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8.sp),
                                        decoration: ShapeDecoration(
                                          shape: CircleBorder(),
                                          color: MounaeColors.primaryTextColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.sp),
                                        child: Text(
                                          'N $amount',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                color: MounaeColors
                                                    .primaryTextColor,
                                              ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
