import 'dart:convert';

import 'package:flutter/material.dart';
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
    // return colactionloading(2);
    return const SpinKitChasingDots(
      color: Color.fromARGB(255, 47, 0, 255),
      // size: 50.0,
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
            // setState(() {

            // });
          },
        ),

        // Switch(
        //     value: isOn,
        //     onChanged: (val) {
        //       setState(() {
        //         lgs = 'en';
        //       });
        //     }),
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

  static checkFormatAccountClose1(data, t) {
    int n = 0;
    if (data.toString().trim().length > 0) {
      n = data.toString().trim().length - 4;
      var x = '';
      var d = '';
      var d1 = '';
      for (int i = 0; i < n; i++) {
        if (t == 'tran' ||
            t == 'tranBank' ||
            t == 'tranAccount' ||
            t == 'withDrowBankToDep') {
          if (i == 0 || i == 2) {
            x = x + 'X-';
          } else {
            x = x + 'X';
          }
          d = data.toString().trim().substring(n, n + 3) + '-';
          d1 = data
              .toString()
              .trim()
              .substring(data.toString().trim().length - 1);
        }
      }

      if (t == 'tran' ||
          t == 'tranBank' ||
          t == 'tranAccount' ||
          t == 'withDrowBankToDep') {
        return x + d + d1;
      } else {
        return checkFormatAccountLoan(data);
      }
    } else {
      return data;
    }
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
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(
            //       builder: (context) => Tabs(p),
            //     ),
            //     (Route<dynamic> route) => false),
          },
          width: displayWidth(context) * 0.3,
          color: MyColor.color('buttontxt'),
        ),
        // DialogButton(
        //   child: Text(
        //     msg,
        //     style: TextStyle(
        //         color: Colors.white, fontSize: displayWidth(context) * 0.035),
        //   ),
        //   onPressed: () => {
        //     Navigator.of(context, rootNavigator: true).pop(),
        //     // Navigator.of(context).pop(),
        //     Navigator.of(context).pushAndRemoveUntil(
        //         MaterialPageRoute(
        //           builder: (context) => Tabs(p),
        //         ),
        //         (Route<dynamic> route) => false),
        //   },
        //   width: displayWidth(context) * 0.3,
        //   color: MyColorPro.color('buttontxt'),
        // )
      ],
    ).show();
  }

  static checkFormatAccountLoan(data) {
    // var d1 = '';
    // var d2 = '';
    // var d3 = '';
    // if (data.toString().trim().length > 0) {
    //   if (data.toString().trim().length == 8) {
    //     d1 = data.toString().trim().substring(0, 1);
    //     d2 = data.toString().trim().substring(1, 6);
    //     d3 = data.toString().trim().substring(6, 8);
    //     return d1 + '-' + d2 + '/' + d3;
    //   } else if (data.toString().trim().length == 9) {
    //     d1 = data.toString().trim().substring(0, 2);
    //     d2 = data.toString().trim().substring(2, 7);
    //     d3 = data.toString().trim().substring(7, 9);
    //     return d1 + '-' + d2 + '/' + d3;
    //   } else {
    //     return data;
    //   }
    // } else {
    //   return data;
    // }
    return data;
  }

  static checkFormatAccountClose(data, t) {
    print(t);
    print(data);
    int n = 0;
    if (data.toString().trim().length > 0) {
      n = data.toString().trim().length - 4;
      var x = '';
      var d = '';
      var d1 = '';
      for (int i = 0; i < n; i++) {
        if (t == 'pay' || t == 'tran' || t == 'tranBank' || t == 'buyshare') {
          if (i == 0 || i == 2) {
            x = x + 'X-';
          } else {
            x = x + 'X';
          }
          d = data.toString().trim().substring(n, n + 3) + '-';
          d1 = data
              .toString()
              .trim()
              .substring(data.toString().trim().length - 1);
        }
      }
      if (t == 'pay' || t == 'tran' || t == 'tranBank' || t == 'buyshare') {
        return x + d + d1;
      } else {
        return data;
      }
    } else {}
  }

  static checkFormatAccountCloseKTB(data, t) {
    print(t);
    print(data);
    int n = 0;
    if (data.toString().trim().length > 0) {
      n = data.toString().trim().length - 4;
      var x = '';
      var d = '';
      var d1 = '';
      for (int i = 0; i < n; i++) {
        if (t == 'pay' ||
                t == 'tran' ||
                t == 'tranBank' ||
                t == 'withDrowBankToDep' ||
                t == 'withDrowLoanToBank'
            // || t == 'buyshare'
            ) {
          if (i == 2 || i == 3) {
            x = x + 'X-';
          } else {
            x = x + 'X';
          }
          d = data.toString().trim().substring(n, n + 3) + '-';
          d1 = data
              .toString()
              .trim()
              .substring(data.toString().trim().length - 1);
        }
      }
      if (t == 'pay' ||
              t == 'tran' ||
              t == 'tranBank' ||
              t == 'withDrowBankToDep' ||
              t == 'withDrowLoanToBank'
          // || t == 'buyshare'
          ) {
        return x + d + d1;
      } else {
        return data;
      }
    } else {}
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

  static Currency() {
    return ' ฿';
  }

  static hiddenDialog(n, context) {
    Future.delayed(Duration(seconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  static List<T> CardMap<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  static formatDatePro(s) {
    print(s.toString());
    String s1;
    String t;
    s = s.toString().replaceAll('T', ' ');
    s = s.toString().replaceAll('.', ' ');
    s1 = s.split(' ')[0].toString();

    String d = s1.split('-')[2].toString();
    String m = s1.split('-')[1].toString();
    String y = (int.parse(s1.split('-')[0]) + 543).toString();
    t = s.split(' ')[1].toString().split(':')[0] +
        ':' +
        s.split(' ')[1].toString().split(':')[1];
    return d + '/' + m + '/' + y + ' ' + t;
  }

  static formatDatePro1(s) {
    try {
      // String s1 = s.split(' ')[0].toString();
      String d = s.split('-')[2].toString();
      String m = s.split('-')[1].toString();
      String y = (int.parse(s.split('-')[0]) + 543).toString();

      print(s);
      return d + '/' + m + '/' + y;
    } catch (de) {
      return '';
    }
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
