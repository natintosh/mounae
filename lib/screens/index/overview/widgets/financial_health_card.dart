import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class FinancialHealthCard extends StatelessWidget {
  final VoidCallback onTap;

  const FinancialHealthCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Financial Health',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                    SizedBox(height: 20.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 140.sp,
                            height: 140.sp,
                            color: Colors.black12,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spendable Income:',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: MounaeColors.greyDescriptionColor,
                                    ),
                              ),
                              Text('N400,000',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText2),
                              SizedBox(height: 20.sp),
                              Text(
                                'Assets:',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: MounaeColors.greyDescriptionColor,
                                    ),
                              ),
                              Text('N400,000',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
