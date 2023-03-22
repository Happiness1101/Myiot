import 'package:flutter/material.dart';
import 'package:iots/class/language.dart';
import 'package:iots/class/myclass.dart';
import 'package:iots/class/mycolor.dart';
import 'package:iots/class/sizes.dart';
import 'package:iots/class/textStyle.dart';

class AccountItem extends StatelessWidget {
  final String? title;
  final String? temp;
  final String? humidity;
  final String? light;

  const AccountItem({
    this.title,
    this.temp,
    this.humidity,
    this.light,
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
                  title!,
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
                    Language.home('tempMax', ''),
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                  Text(
                    MyClass.checkNull(humidity),
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
                  Language.home('humidityMax', ''),
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                  Text(
                    MyClass.checkNull(temp),
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
                   Language.home('lightMax', ''),
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                  Text(
                    MyClass.checkNull(light),
                    textScaleFactor: MyClass.FontSizeApp(1.0),
                    style: CustomTextStyle.defaultTxt(
                      context,
                      -5,
                    ),
                  ),
                ],
              ),
              // Column(
              //   children: [
              //     Text(
              //       "Wind",
              //       textScaleFactor: MyClass.FontSizeApp(1.0),
              //       style: CustomTextStyle.defaultTxt(
              //         context,
              //         -5,
              //       ),
              //     ),
              //     Text(
              //       MyClass.checkNull(light),
              //       textScaleFactor: MyClass.FontSizeApp(1.0),
              //       style: CustomTextStyle.defaultTxt(
              //         context,
              //         -5,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          )
        ],
      ),
    );
  }
}
