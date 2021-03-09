import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class BudgetItemCard extends StatelessWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const BudgetItemCard(
      {Key key,
      @required this.title,
      @required this.primaryColor,
      @required this.secondaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.zero,
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
                  'Budget Overview: 70%',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(height: 8.sp),
              Container(
                height: 16.sp,
                width: double.infinity,
                color: Colors.black12,
              ),
              SizedBox(height: 16.sp),
            ],
          ),
        ),
      ),
    );
  }
}
