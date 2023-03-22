import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:iots/bloc/iot_bloc.dart';
import 'package:iots/class/item.dart';
import 'package:iots/class/language.dart';
import 'package:iots/class/myclass.dart';
import 'package:iots/class/mycolor.dart';
import 'package:iots/class/sizes.dart';
import 'package:iots/page/grap.dart';
import 'package:iots/service/network.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../../class/textStyle.dart';
import '../../model/room1Model.dart';
import '../../service/mqtt.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List cardList = [];
  int _currentIndex = 0;
  String? dateTime;
  Stream? stream;

  _account() {
    setState(() {
      cardList.add(AccountItem(
        title: 'Test',
      ));
    });
  }

  final iconListA = [
    'assets/imgs/temp.png',
    'assets/imgs/humi.png',
    'assets/imgs/light.png',
  ];

  final colorList = [
    'headtitle',
    'buttongra',
    'buttonG',
  ];

  final textList = [
    'C',
    '%',
    '%',
  ];

  final textListd = [
    'temp',
    'humi',
    '%',
  ];

  @override
  void initState() {
    // Network.fetchMRoom1;

    dateTime = DateFormat.yMd().add_jm().format(DateTime.now());
    _account();
    // TODO: implement initState
    super.initState();
  }

  static late MqttClient client;

  // for listen from other pages.
  // and can close listen mqtt.

  @override
  Widget build(BuildContext context) {
    // main();
    final loginBloc = BlocProvider(create: (context) => LoginBloc());
    final lgsBloc = BlocProvider(create: (context) => LgsBloc());
    return MultiBlocProvider(
      providers: [loginBloc],
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: MyClass.backGround(),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: displayHeight(context) * 0.05),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        disableCenter: true,
                        height: displayHeight(context) * 0.20,
                        aspectRatio: 12.0,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: cardList.map((cards) {
                        return Builder(builder: (BuildContext context) {
                          return Card(
                            shadowColor: Colors.black,
                            semanticContainer: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MyClass.CardBorderRadius()),
                            ),
                            child: cards,
                          );
                        });
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          StreamBuilder<List<MqttReceivedMessage<MqttMessage>>>(
                            stream: Network().mqttStream('Room1/Jame'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    BlocBuilder<LgsBloc, LgsState>(
                                      builder: (context, state) {
                                        print("DebugX: ${state.lgs}");
                                        return Column(
                                          children: [
                                            _detail(snapshot.data, state.lgs),
                                            _detail1(snapshot.data, state.lgs),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Text('Waiting for messages...');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detail(room1, lgs) {
    final List jsonResponse = MyClass.jsonValue(room1);
    print(jsonResponse);
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyClass.CardBorderRadius()),
        ),
        width: displayWidth(context) * 0.9,
        height: displayWidth(context) * 0.6,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MyClass.CardBorderRadius()),
          ),
          elevation: 5,
          shadowColor: Colors.black,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Language.home('room1', lgs),
                          textScaleFactor: MyClass.FontSizeApp(1.0),
                          style:
                              CustomTextStyle.defaultTxtCc(context, -5, 'Bl'),
                        ),
                        Text(
                          dateTime.toString(),
                          textScaleFactor: MyClass.FontSizeApp(1.0),
                          style:
                              CustomTextStyle.defaultTxtCc(context, -10, 'Bl'),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        print("object");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Grap(
                                    //  data: jsonResponse.toList(),
                                    pressure: jsonResponse[0]['Pressure'],
                                    ennergy: jsonResponse[0]['Ennergy'],
                                    voltage: jsonResponse[0]['Voltage'],
                                    lgs: 'th',
                                  )),
                        );
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 248, 103, 0),
                        size: 30.0,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: MyColor.color(colorList[0]),
                        borderRadius: BorderRadius.circular(
                          MyClass.CardBorderRadius() - 15,
                        ),
                      ),
                      width: displayWidth(context) * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                iconListA[0],
                                width: tabletMode ? 40 : 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      Language.home('temp', lgs),
                                      textScaleFactor: MyClass.FontSizeApp(1.0),
                                      style: CustomTextStyle.defaultCTxt(
                                          context, -2, 'Bl'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          jsonResponse[0]['Temp_Room1'],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultTxt(
                                              context, -2),
                                        ),
                                        Text(
                                          textList[0],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultCTxt(
                                              context, -2, 'Bl'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: MyColor.color(colorList[1]),
                        borderRadius: BorderRadius.circular(
                          MyClass.CardBorderRadius() - 15,
                        ),
                      ),
                      width: displayWidth(context) * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                iconListA[1],
                                width: tabletMode ? 40 : 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      Language.home('humidity', lgs),
                                      textScaleFactor: MyClass.FontSizeApp(1.0),
                                      style: CustomTextStyle.defaultCTxt(
                                          context, -2, 'Bl'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          jsonResponse[0]['Humidity_Room1'],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultTxt(
                                              context, -2),
                                        ),
                                        Text(
                                          textList[1],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultCTxt(
                                              context, -2, 'Bl'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: MyColor.color(colorList[2]),
                        borderRadius: BorderRadius.circular(
                          MyClass.CardBorderRadius() - 15,
                        ),
                      ),
                      width: displayWidth(context) * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                iconListA[2],
                                width: tabletMode ? 40 : 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      Language.home('light', lgs),
                                      textScaleFactor: MyClass.FontSizeApp(1.0),
                                      style: CustomTextStyle.defaultCTxt(
                                          context, -2, 'Bl'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          jsonResponse[0]['Light'],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultTxt(
                                              context, -2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          MyClass.CardBorderRadius() - 15,
                        ),
                      ),
                      width: displayWidth(context) * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                iconListA[2],
                                width: tabletMode ? 40 : 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      Language.home('PM', lgs),
                                      textScaleFactor: MyClass.FontSizeApp(1.0),
                                      style: CustomTextStyle.defaultCTxt(
                                          context, -2, 'Bl'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          jsonResponse[0]['PM2.5'],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultTxt(
                                              context, -2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _detail1(room1,lgs) {
    final List jsonResponse = MyClass.jsonValue(room1);
    print(jsonResponse);
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyClass.CardBorderRadius()),
        ),
        width: displayWidth(context) * 0.9,
        height: displayWidth(context) * 0.6,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MyClass.CardBorderRadius()),
          ),
          elevation: 5,
          shadowColor: Colors.black,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Language.home('room2', lgs),
                          textScaleFactor: MyClass.FontSizeApp(1.0),
                          style:
                              CustomTextStyle.defaultTxtCc(context, -5, 'Bl'),
                        ),
                        Text(
                          dateTime.toString(),
                          textScaleFactor: MyClass.FontSizeApp(1.0),
                          style:
                              CustomTextStyle.defaultTxtCc(context, -10, 'Bl'),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        print("object");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Grap(
                                    //  data: jsonResponse.toList(),
                                    pressure: jsonResponse[0]['Pressure'],
                                    ennergy: jsonResponse[0]['Ennergy'],
                                    voltage: jsonResponse[0]['Voltage'],
                                    lgs: 'th',
                                  )),
                        );
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 248, 103, 0),
                        size: 30.0,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: MyColor.color(colorList[0]),
                        borderRadius: BorderRadius.circular(
                          MyClass.CardBorderRadius() - 15,
                        ),
                      ),
                      width: displayWidth(context) * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                iconListA[0],
                                width: tabletMode ? 40 : 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                    Language.home('temp', lgs),
                                      textScaleFactor: MyClass.FontSizeApp(1.0),
                                      style: CustomTextStyle.defaultCTxt(
                                          context, -2, 'Bl'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          jsonResponse[0]['Humidity_Room2'],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultTxt(
                                              context, -2),
                                        ),
                                        Text(
                                          textList[0],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultCTxt(
                                              context, -2, 'Bl'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: MyColor.color(colorList[1]),
                        borderRadius: BorderRadius.circular(
                          MyClass.CardBorderRadius() - 15,
                        ),
                      ),
                      width: displayWidth(context) * 0.34,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                iconListA[1],
                                width: tabletMode ? 40 : 50,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                       Language.home('humidity', lgs),
                                  
                                      textScaleFactor: MyClass.FontSizeApp(1.0),
                                      style: CustomTextStyle.defaultCTxt(
                                          context, -2, 'Bl'),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          jsonResponse[0]['Temp_Room2'],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultTxt(
                                              context, -2),
                                        ),
                                        Text(
                                          textList[1],
                                          textScaleFactor:
                                              MyClass.FontSizeApp(1.0),
                                          style: CustomTextStyle.defaultCTxt(
                                              context, -2, 'Bl'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
