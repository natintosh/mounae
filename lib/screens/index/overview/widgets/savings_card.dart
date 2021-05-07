import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class SavingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        color: MounaeColors.savingsColor,
        child: SizedBox(
          height: 233.sp,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  opacity: 0.6,
                  child: SvgPicture.asset(
                    'assets/svg/savings_people_right.svg',
                    width: double.infinity,
                    alignment: Alignment.bottomRight,
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
                          'Savings',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: MounaeColors.writingColor),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: MounaeColors.writingColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.sp),
                    Container(
                      padding: EdgeInsets.only(right: 78.sp),
                      child: Text(
                        'Money set aside for personal purpose or to achieve a set of goals',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: MounaeColors.writingColor,
                            ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      padding: EdgeInsets.only(right: 84.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'N600,000',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                                color: MounaeColors.writingColor,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 9.sp),
                    Container(
                      height: 24.sp,
                      alignment: Alignment.centerLeft,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.sp),
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: MounaeColors.writingColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 12.sp),
                                child: Text(
                                  'N200,000',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: MounaeColors.writingColor,
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
    );
  }
}
