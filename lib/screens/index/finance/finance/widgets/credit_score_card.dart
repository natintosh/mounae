import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class CreditScoreCard extends StatelessWidget {
  const CreditScoreCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.only(top: 24.sp, bottom: 16.sp) +
            EdgeInsets.symmetric(horizontal: 16.sp),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Credit Score',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            SizedBox(height: 8.sp),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 77.sp),
              child: Text(
                'Your great score is currently perfect and we believe you can make it better',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: MounaeColors.greyDescriptionColor),
              ),
            ),
            SizedBox(height: 32.sp),
            Container(
              alignment: Alignment.center,
              child: Container(
                width: 150.sp,
                height: 150.sp,
                color: Colors.black12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
