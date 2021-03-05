import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class BudgetingCard extends StatelessWidget {
  const BudgetingCard({
    Key key,
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
                        'Budgeting',
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
                      'Plan how and when you want to spend your income',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: MounaeColors.greyDescriptionColor,
                          ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Container(
                    padding: EdgeInsets.only(right: 84.sp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'N600,000',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: MounaeColors.writingColor,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: MounaeColors.expenseCaptionTextColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.sp),
                        child: Text(
                          'Expense',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: MounaeColors.expenseCaptionTextColor,
                              ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: MounaeColors.balanceCaptionTextColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.sp),
                        child: Text(
                          'Balance',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                color: MounaeColors.balanceCaptionTextColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.sp),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              color: Colors.black12,
                              height: 16.sp,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'N400,000',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      color:
                                          MounaeColors.expenseCaptionTextColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.sp),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              color: Colors.black12,
                              height: 16.sp,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'N400,000',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      color:
                                          MounaeColors.expenseCaptionTextColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.sp),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              color: Colors.black12,
                              height: 16.sp,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'N400,000',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      color:
                                          MounaeColors.expenseCaptionTextColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
