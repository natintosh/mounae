import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Transactions',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                  SizedBox(height: 2.sp),
                  Container(
                    padding: EdgeInsets.only(right: 78.sp),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detailed analysis of all your transactions',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: MounaeColors.greyDescriptionColor,
                          ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 34.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: 140.sp,
                          height: 140.sp,
                          color: Colors.black12,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Income:',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: MounaeColors.greyDescriptionColor,
                                  ),
                            ),
                            Text(
                              'N400,000',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: MounaeColors.incomeTextColor,
                                  ),
                            ),
                            SizedBox(height: 20.sp),
                            Text(
                              'Total Expenses:',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: MounaeColors.greyDescriptionColor,
                                  ),
                            ),
                            Text(
                              'N400,000',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: MounaeColors.expensesTextColor,
                                  ),
                            ),
                            SizedBox(height: 20.sp),
                            Text(
                              'Total Debt:',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: MounaeColors.greyDescriptionColor,
                                  ),
                            ),
                            Text(
                              'N400,000',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: MounaeColors.debtTextColor,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recent Transaction',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: MounaeColors.greyDescriptionColor,
                          ),
                    ),
                  ),
                  ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 2,
                    separatorBuilder: (context, count) {
                      return Divider(
                        indent: 24.sp,
                      );
                    },
                    itemBuilder: (context, count) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black12,
                        ),
                        title: Text('Gokada Salary'),
                        subtitle: Text(
                          'Category: Salary',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: MounaeColors.greyDescriptionColor,
                              ),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('-N24,000'),
                            Text(
                              '23 Sept, 2020',
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: MounaeColors.greyDescriptionColor,
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
