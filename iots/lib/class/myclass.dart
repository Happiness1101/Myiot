import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:iots/class/mycolor.dart';
import 'package:iots/class/sizes.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyClass {
  static hostMqtt() {
    return '45.91.132.179';
  }

  static port() {
    return 1883;
  }

  static FontSizeApp(s) {
    return s;
  }

  static hostapp() {
    return 'http://45.91.132.179';
  }

  static jsonValue(s) {
    final recMess = s[0].payload as MqttPublishMessage;
    String message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    String decodeMessage = Utf8Decoder().convert(message.codeUnits);
    return json.decode('[' + decodeMessage + ']');
  }

  static loading() {
    return const SpinKitChasingDots(
      color: Color.fromARGB(255, 47, 0, 255),
    );
  }

  static appbar() {
    String? lgs = 'th';
    bool isOn = false;
    return AppBar(
      iconTheme: IconThemeData(color: Colors.green),
      centerTitle: true,
      title: const Text(
        'IOT APP',
      ),
      titleTextStyle: TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      actions: [
        FlutterSwitch(
          inactiveToggleColor: MyColor.color('B'),
          activeToggleColor: MyColor.color('B'),
          inactiveText: 'EN',
          activeText: 'TH',
          value: isOn,
          showOnOff: true,
          onToggle: (val) {
            isOn = val;
            lgs = 'en';
          },
        ),
      ],
    );
  }

  static backGround() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/imgs/bg.png"),
        fit: BoxFit.cover,
      ),
    );
  }


  static showAlerttimeout(msg, context, t, c, f, l, p) {
    // Navigator.of(context).pop();
    Alert(
      closeIcon: Container(),
      context: context,
      type: AlertType.warning,
      title: "",
      desc: msg,
      onWillPopActive: true,
      buttons: [
        DialogButton(
          child: Text(
            "ปิด",
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.035),
          ),
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
          
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('buttontxt'),
        ),
      
      ],
    ).show();
  }

  static CardBorderRadius() {
    double n = 20.00;
    return n;
  }

  static checkNull(data) {
    return data.toString() == null
        ? ''
        : data.toString() == "null"
            ? ''
            : data.toString();
  }

  static List<T> CardMap<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }



  static getDatePro() {
    List dateList = [];
    var y = DateTime.now().year;
    var m = DateTime.now().month;
    var j = 0;
    var mm;
    var yy = y;
    var date;
    var dateNo;
    for (int i = 0; i < 12; i++) {
      if (m - j == 0) {
        m = 12;
        mm = m;
        yy = y - 1;
        j = 0;
      } else {
        mm = m - j;
      }
      j++;
      date = mm.toString() + "/" + (yy + 543).toString();
      dateNo = yy.toString() + "-" + mm.toString();
      dateList.addAll([
        {"date": date, "dateNo": dateNo}
      ]);
    }
    return dateList;
    // print(dateList);
  }

  String getTime() {
    String _timeString;
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    return formattedDateTime;
    // setState(() {
    //   _timeString = formattedDateTime;
    // });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  // static showToastPro(msg, context) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 3);
  // }

  static showAlertPro(msg, context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "",
      desc: msg,
      onWillPopActive: true,
      // closeFunction: ,
      buttons: [
        DialogButton(
          child: Text(
            "ปิด",
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.05),
          ),
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('buttontxt'),
        ),
      ],
    ).show();
  }

  static showAlertProApprove1(msg, context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "",
      desc: msg,
      onWillPopActive: true,
      // closeFunction: ,
      buttons: [
        DialogButton(
          child: Text(
            "ปิด",
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.05),
          ),
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('buttontxt'),
        ),
      ],
    ).show();
  }

  static showAlertPro1(msg, context, param, bankNo) {
    // Navigator.of(context).pop();
    Alert(
      context: context,
      type: AlertType.warning,
      title: "",
      desc: msg,
      onWillPopActive: true,
      buttons: [
        DialogButton(
          child: Text(
            "ปิด",
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.05),
          ),
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.of(context).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('buttontxt'),
        ),
        DialogButton(
          child: Text(
            "เชื่อมต่อบัญชี",
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.05),
          ),
          onPressed: () => {
            // Navigator.of(context).pop(),
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => PdpaAccount(
            //             param: param,
            //             bank_No: bankNo,
            //             accountStatusBay: "1",
            //             accountBay: '',
            //           )),
            // ),
            Navigator.of(context, rootNavigator: true).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('buttontxt'),
        )
      ],
    ).show();
  }

  static showAlertProApprove(msg, context) {
    // Navigator.of(context).pop();
    Alert(
      context: context,
      type: AlertType.success,
      title: "",
      desc: msg,
      onWillPopActive: true,
      buttons: [
        DialogButton(
          child: Text(
            "ปิด",
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.05),
          ),
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.of(context).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('buttontxt'),
        ),
      ],
    ).show();
  }

  static showAlertPro2(msg, context) {
    // Navigator.of(context).pop();
    Alert(
      context: context,
      type: AlertType.success,
      title: "",
      desc: msg,
      onWillPopActive: true,
      buttons: [
        DialogButton(
          child: Text(
            "ปิด",
            style: TextStyle(
                color: Colors.white, fontSize: displayWidth(context) * 0.05),
          ),
          onPressed: () => {
            Navigator.of(context, rootNavigator: true).pop(),
            Navigator.of(context).pop(),
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('buttontxt'),
        ),
      ],
    ).show();
  }

  static txtPro() {
    return 'ยังไม่มีดาต้าในการทดสอบ อยู่ระหว่างการพัฒนาระบบ  การทำงานของโปรแกรมหน้านี้จะเหมือนกับเมนู โอนเงินตนเอง';
  }

  static bankName() {
    List _itemsaccountbank = [];
    _itemsaccountbank = [
      // {"value": 'ktb', "text": 'กรุงไทย\nKTB', "img": 'assets/imgPro/ktb.png'},
      {
        "value": 'gsb',
        "text": 'ธนาคารออมสิน\nGSB',
        "img": 'assets/imgPro/gsb.png'
      },
    ];
    return _itemsaccountbank;
  }

  static checkAmount10(amount) {
    int c = int.parse(amount) % 10;
    if (c == 0) {
      return 't';
    } else {
      return 'f';
    }
  }

  static isNumericUsing_tryParse(s) {
    print(FormatNumberRcomma(s));
    var string = FormatNumberRcomma(s);
    if (string.toString() == null || string.toString().isEmpty) {
      return false;
    }
    final number = num.tryParse(string.toString());
    if (number == null) {
      return false;
    }
    return true;
  }

  // static setFormatNumber(value) {
  //   var price = double.parse(value);
  //   var comma = NumberFormat('###,###,###,###');
  //   return comma.format(price).replaceAll(' ', '');
  // }

  static FormatNumberRcomma(data) {
    double x = double.parse(data.replaceAll(',', '').toString());
    // toStringAsFixed(2)
    return x.toStringAsFixed(2);
  }

  // static setDot() {
  //   print(NumberFormat.simpleCurrency(name: '').format(123456.32));
  //   // return   NumberFormat.simpleCurrency(name: 'EURO').format(123456); // EURO123,456.00
  //   return RegExp("(\\d+[,.]?[\\d{2}]*)");
  // }
}
