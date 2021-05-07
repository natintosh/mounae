import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const PlanCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        color: color,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.sp,
              vertical: 24.sp,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: MounaeColors.primaryTextColor,
                        ),
                  ),
                ),
                SizedBox(height: 8.sp),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(right: 72.sp),
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: MounaeColors.primaryTextColor,
                        ),
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
