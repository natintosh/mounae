import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class AssetsCard extends StatelessWidget {
  const AssetsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        color: MounaeColors.assetsColor,
        child: SizedBox(
          height: 233.sp,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Opacity(
                  opacity: 0.6,
                  child: SvgPicture.asset(
                    'assets/svg/assets_buildings.svg',
                    height: 80.sp,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.bottomLeft,
                    allowDrawingOutsideViewBox: true,
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
                          'Asset(s)',
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
                      padding: EdgeInsets.only(right: 24.sp),
                      child: Text(
                        'Add your owned asset like Cars, Houses, Buildings or Gold for a full overview of your net worth',
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
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: MounaeColors.writingColor,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 9.sp),
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
