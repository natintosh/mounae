import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class TransactionHistorySliverDelegate extends SliverPersistentHeaderDelegate {
  final String currentFilterMode;
  final double height;
  final VoidCallback onFilterButtonTapped;

  TransactionHistorySliverDelegate(
      {@required this.currentFilterMode,
      @required this.height,
      @required this.onFilterButtonTapped})
      : assert(height != null),
        assert(currentFilterMode != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height.sp,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.all(16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction History',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: MounaeColors.greyDescriptionColor),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.swap_vert),
                label: Text('Weekly'),
                style: Theme.of(context).textButtonTheme.style.copyWith(
                      padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                      overlayColor: MaterialStateProperty.all<Color>(
                          MounaeColors.greyDescriptionColor.withOpacity(0.3)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          MounaeColors.greyDescriptionColor),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        Theme.of(context).textTheme.bodyText2,
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
  double get maxExtent => height.sp;

  @override
  double get minExtent => height.sp;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
