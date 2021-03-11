import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class SearchAddSliverPersistentDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final VoidCallback onAddButtonPressed;

  SearchAddSliverPersistentDelegate(
      {@required this.onAddButtonPressed, @required this.height});

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
          child: TextField(
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
              hintText: 'Search or Create New',
              hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: MounaeColors.hintTextColor,
                  ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.add_circle_outlined,
                  color: MounaeColors.purpleProgressMinorColor,
                ),
                onPressed: onAddButtonPressed,
              ),
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
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
