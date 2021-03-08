import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

class LargestTransactionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Largest Transactions',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              SizedBox(height: 4.sp),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(right: 96.sp),
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: MounaeColors.greyDescriptionColor),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                  );
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Gokada Salary'),
                    subtitle: Text(
                      'Debit',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: MounaeColors.greyDescriptionColor),
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('N24,000'),
                        SizedBox(height: 4.sp),
                        Text(
                          '20 Sept, 2020',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: MounaeColors.greyDescriptionColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
