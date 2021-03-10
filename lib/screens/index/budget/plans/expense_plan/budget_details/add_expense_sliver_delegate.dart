import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class AddExpenseSliverDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final String subTitle;
  final double height;
  final VoidCallback onTap;

  AddExpenseSliverDelegate({
    @required this.title,
    @required this.subTitle,
    @required this.height,
    @required this.onTap,
  }) : assert(height != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      child: Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAlias,
            children: [
              Align(
                alignment: Alignment(1.sp, 2.8.sp),
                child: Opacity(
                  opacity: 0.6,
                  child: SvgPicture.asset(
                    'assets/svg/contained_add.svg',
                    width: 91.sp,
                    height: 91.sp,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.sp),
                  width: 258.sp,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: MounaeColors.primaryColor),
                      ),
                      SizedBox(height: 8.sp),
                      Text(
                        subTitle,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
