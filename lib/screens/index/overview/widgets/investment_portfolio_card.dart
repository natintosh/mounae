import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class InvestmentPortfolioCard extends StatelessWidget {
  const InvestmentPortfolioCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        color: MounaeColors.investmentPortfolioColor,
        child: SizedBox(
          height: 233.sp,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  'assets/svg/investment_portfolio.svg',
                  height: 80.sp,
                  alignment: Alignment.bottomLeft,
                  allowDrawingOutsideViewBox: true,
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
                          'Investment Portfolio',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: MounaeColors.primaryTextColor),
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
                        'let your money work for you the way your mind, body and soul does.',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: MounaeColors.primaryTextColor,
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
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontWeight: FontWeight.bold,
                                color: MounaeColors.primaryTextColor,
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
