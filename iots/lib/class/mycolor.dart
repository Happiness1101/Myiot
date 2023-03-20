import 'package:flutter/material.dart';

class MyColor {
  static color(data) {
    if (data.toString() == 'colorheader') {
      return Color(0xFFF5D512);
    } else if (data.toString() == 'datatitle') {
      return Color(0xFFF5F5F5);
    } else if (data.toString() == 'headtitle') {
      return Color.fromARGB(255, 33, 150, 243);
    } else if (data.toString() == 'linelist') {
      return Colors.grey;
    } else if (data.toString() == 'TextFormFieldTextStyle') {
      return Color(0xFF6C6C6C);
    } else if (data.toString() == 'TextFormFieldBorderSide') {
      return Color.fromARGB(255, 7, 0, 195);
    } else if (data.toString() == 'button') {
      return Color.fromARGB(255, 47, 0, 255);
    } else if (data.toString() == 'button1') {
      return Color.fromARGB(255, 255, 0, 0);
    } else if (data.toString() == 'buttonG') {
      return Color(0xFF0B9931);
    } else if (data.toString() == 'buttonnext') {
      return Color(0xFF000000);
    } else if (data.toString() == 'slide1') {
      return Colors.white;
    } else if (data.toString() == 'slide2') {
      return Color.fromARGB(255, 47, 0, 255);
    } else if (data.toString() == 'imgprofile') {
      return Color(0xFFF5D512);
    } else if (data.toString() == 'detailhead') {
      return Color(0xFF6D6D6D);
    } else if (data.toString() == 'settings') {
      return Color(0xFFF5D512);
    } else if (data.toString() == 'buttongra') {
      return Color(0xFFD37A29);
    } else if (data.toString() == 'buttongra1') {
      return Color(0xFFD37A29);
    } else if (data.toString() == 'buttongra2') {
      return Color(0xFFD37A29);
    } else if (data.toString() == 'buttongra3') {
      return Color(0xFFD37A29);
    } else if (data.toString() == 'tabs') {
      return Color(0x441CA7EC);
    } else if (data.toString() == 'bg') {
      return Color(0x441CA7EC);
    } else if (data.toString() == 'R') {
      return Color(0xFFD01616);
    } else if (data.toString() == 'B') {
      return Color(0xFF192AF5);
    } else if (data.toString() == 'G') {
      return Color(0xFF1FC019);
    } else if (data.toString() == 'BlH') {
      return Color(0xFF262626);
    } else if (data.toString() == 'Or') {
      return Color(0xFFE85B00);
    } else if (data.toString() == 'Gr') {
      return Color(0xFF969696);
    } else if (data.toString() == 'Pul') {
      return Color.fromARGB(255, 195, 0, 175);
    }else if (data.toString() == 'divider') {
      return Color(0xFF000000);
    } else if (data.toString() == 'Bl') {
      return Color(0xFF000000);
    } else if (data.toString() == 'LineColor') {
      return Color(0xFF000000);
    } else if (data.toString() == 'SettingBackground') {
      return Colors.white.withOpacity(0.9);
    } else if (data.toString() == 'W') {
      return Color(0xFFFFFFFF);
    }
  }

  static ColorLinear(data) {
    if (data.toString() == "button") {
      return <Color>[
        Color.fromARGB(255, 7, 0, 202),
        Color.fromARGB(255, 186, 0, 0),
        // Color.fromARGB(255, 250, 36, 36),
        Color.fromARGB(255, 250, 107, 107),
      ];
    } else if (data.toString() == "button2") {
      return <Color>[
        Color.fromARGB(255, 194, 8, 8),
        Color.fromARGB(255, 27, 0, 202),
        // Color.fromARGB(255, 55, 52, 206),
        Color.fromARGB(255, 104, 93, 225),
      ];
    } else if (data.toString() == "buttonpro") {
      return <Color>[
        Color.fromARGB(255, 8, 0, 243),
        Color.fromARGB(255, 58, 51, 243),
        Color.fromARGB(255, 110, 106, 234),
      ];
    } else if (data.toString() == "button3") {
      return <Color>[
        Colors.green,
        Colors.green,
        Colors.green,
      ];
    } else if (data.toString() == "buttoncheckrg1") {
      return <Color>[
        Color(0xFF42E974),
        Color(0xFF42E974),
        Color(0xFF189D6C),
      ];
    } else if (data.toString() == "buttoncheckrg2") {
      return <Color>[
        Color(0xFF0135E1),
        Color(0xFF0135E1),
        Color(0xFF393694),
      ];
    }
  }
}

