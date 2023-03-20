import 'package:flutter/material.dart';
import 'package:iots/class/myclass.dart';
import 'package:iots/class/mycolor.dart';
import 'package:iots/class/sizes.dart';
import 'package:iots/class/textStyle.dart';

class AccountItem extends StatelessWidget {
  final String? title;
  // final String? accountId;
  // final double? remainingAmount;
  // final double? withdrawalAmount;
  // final double? fontsizeapps;
  // final String? lgs;
  // final double? outstanding_balance;
  // final String? withdrawFlag;
  // final String? type;
  // final String? mobileFlag;

  const AccountItem({
    this.title,
    // this.accountId,
    // this.remainingAmount,
    // this.withdrawalAmount,
    // this.fontsizeapps,
    // this.lgs,
    // this.outstanding_balance,
    // this.withdrawFlag,
    // this.type,
    // this.mobileFlag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MyClass.CardBorderRadius()),
        color: MyColor.color('headtitle'),
      ),
      // color: MyColor.color('Or'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: displayWidth(context) * 0.00,
              left: displayWidth(context) * 0.05,
              right: displayWidth(context) * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/imgs/climate.png',
                  width: 80,
                  height: 80,
                ),
                // Icon(
                //   Icons.account_balance_wallet,
                //   color: MyColor.color('w'),
                // ),
                Text(
                  title! + '  C',
                  textScaleFactor: MyClass.FontSizeApp(1.0),
                  style: CustomTextStyle.defaultCTxt(context, 0, 'Bl'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "humidity",
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                  Text(
                    MyClass.checkNull('-'),
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Temp(min)",
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                  Text(
                    MyClass.checkNull('-'),
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Temp(max)",
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                  Text(
                    MyClass.checkNull('-'),
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Wind",
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                  Text(
                    MyClass.checkNull('-'),
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
