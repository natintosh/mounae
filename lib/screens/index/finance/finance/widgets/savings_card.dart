import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class SavingsCard extends StatelessWidget {
  const SavingsCard({
    Key? key,
    required this.onStartSavingsButtonPressed,
  }) : super(key: key);

  final VoidCallback onStartSavingsButtonPressed;

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
              child: Text('Savings',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            SizedBox(height: 8.sp),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 96.sp),
              child: Text(
                'You are saving less than 20% of your monthly fixed income',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: MounaeColors.greyDescriptionColor),
              ),
            ),
            SizedBox(height: 14.sp),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Proposed Solution:',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MounaeColors.investmentPortfolioColor),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 56.sp),
              child: Text(
                'By saving N4000 of your monthly fixed income and reducing your expenses to 40% of your income, You can achieve a 10% growth in valuation by the year ends',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: MounaeColors.investmentPortfolioColor),
              ),
            ),
            SizedBox(height: 21.sp),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onStartSavingsButtonPressed,
                child: Text('Start Saving'),
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        MounaeColors.savingsColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
