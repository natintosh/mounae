import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class BudgetItemCard extends StatelessWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final VoidCallback onTapped;

  const BudgetItemCard({
    Key key,
    @required this.title,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onTapped,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 16.sp),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                SizedBox(height: 12.sp),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: primaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0.sp),
                      child: Text(
                        'Expense',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: primaryColor,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 12.sp,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.sp),
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: secondaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.0.sp),
                      child: Text(
                        'Balance',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: secondaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.sp),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Budget Overview: 0%',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                SizedBox(height: 8.sp),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 16.sp,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.sp),
                                  bottomLeft: Radius.circular(
                                    32.sp,
                                  ))),
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 100,
                      child: Container(
                        height: 16.sp,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(32.sp),
                                  bottomRight: Radius.circular(
                                    32.sp,
                                  ))),
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
