import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class PeriodGrid extends StatelessWidget {
  final int? index;
  final List<String> items;
  final ValueChanged<int> onTap;

  const PeriodGrid({
    required this.index,
    required this.items,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          childAspectRatio: 101 / 42,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            color: index == this.index
                ? MounaeColors.selectedPeriodCardColor
                : MounaeColors.periodCardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.sp)),
            elevation: index == this.index ? null : 0,
            child: InkWell(
              onTap: () {
                onTap(index);
              },
              child: Container(
                padding: EdgeInsets.all(12.sp),
                child: Center(
                  child: Text(
                    items[index],
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: index == this.index
                              ? MounaeColors.primaryTextColor
                              : MounaeColors.writingColor,
                        ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
