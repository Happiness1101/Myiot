import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iots/class/mycolor.dart';
import 'package:iots/class/sizes.dart';
import 'package:flutter/foundation.dart';

class CustomTextStyle {
  static TextStyle defaultCTxt(BuildContext context, double number, color) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * (kIsWeb ? 0.045:Platform.isAndroid ? 0.045 : 0.050 ) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColor.color(color));
  }

   static TextStyle defaultTxtB(BuildContext context, double number, color) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * (kIsWeb ? 0.045:Platform.isAndroid ? 0.045 : 0.050 ) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColor.color(color));
  }
  
    static TextStyle defaultTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontFamily: "prompt",
        // fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * (kIsWeb ? 0.045:Platform.isAndroid ? 0.045 : 0.045 ) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: Color.fromARGB(255, 0, 0, 0));
  }

     static TextStyle defaultTxtUl(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontFamily: "prompt",
         decoration: TextDecoration.underline,
        // fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * (kIsWeb ? 0.045:Platform.isAndroid ? 0.045 : 0.045 ) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: Color.fromARGB(255, 0, 0, 0));
  }

      static TextStyle defaultTxtCc(BuildContext context, double number,String color) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.bodyText1!.copyWith(
        fontFamily: "prompt",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * (kIsWeb ? 0.045:Platform.isAndroid ? 0.045 : 0.050 ) +
            number,
        // fontSize: tabletMode ? 30 + number : 17 + number,
        color: MyColor.color(color));
  }
}