import 'package:flutter/material.dart';
import 'package:iots/class/sizes.dart';

class CustomUI {
    static Container appbarDetailUi(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // imageCache.clear();
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.07),
      child: CircleAvatar(
        radius: tabletMode ? 80 : 60,
        backgroundColor: Colors.transparent,
      //  child: Image.asset(url),
       backgroundImage: AssetImage(url),
      ),
    );
  }

    static Positioned appbarUi(context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Positioned(
      top: tabletMode ? 40.0 : -10,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        iconTheme: IconThemeData(
          size: tabletMode ? 50 : 25,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}