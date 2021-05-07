import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class FinanceTabBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final int selectedItem;
  final double height;
  final ValueChanged<int> onTabSelected;

  FinanceTabBarSliverDelegate(
      {required this.selectedItem,
      required this.height,
      required this.onTabSelected});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: GestureDetector(
                  onTap: () => onTabSelected(0),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 200),
                    style: selectedItem == 0
                        ? Theme.of(context).primaryTextTheme.bodyText1!
                        : Theme.of(context).textTheme.caption!.copyWith(
                              color: MounaeColors.greyDescriptionColor,
                            ),
                    child: Text('Analysis'),
                  ),
                ),
              ),
              SizedBox(width: 25.sp),
              Container(
                child: GestureDetector(
                  onTap: () => onTabSelected(1),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 200),
                    style: selectedItem == 1
                        ? Theme.of(context).primaryTextTheme.bodyText1!
                        : Theme.of(context).textTheme.caption!.copyWith(
                              color: MounaeColors.greyDescriptionColor,
                            ),
                    child: Text('Reports'),
                  ),
                ),
              ),
              SizedBox(width: 25.sp),
              Container(
                child: GestureDetector(
                  onTap: () => onTabSelected(2),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 200),
                    style: selectedItem == 2
                        ? Theme.of(context).primaryTextTheme.bodyText1!
                        : Theme.of(context).textTheme.caption!.copyWith(
                              color: MounaeColors.greyDescriptionColor,
                            ),
                    child: Text('Category'),
                  ),
                ),
              ),
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
    return (oldDelegate as FinanceTabBarSliverDelegate).selectedItem !=
        selectedItem;
  }
}
