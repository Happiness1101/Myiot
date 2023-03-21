/// Package import
import 'package:at_gauges/at_gauges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:iots/class/mycolor.dart';
import 'package:iots/class/sizes.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

import '../class/customUI.dart';
import '../class/language.dart';
import '../class/myclass.dart';
import '../class/textStyle.dart';
import '../model/room1Model.dart';
import '../service/network.dart';

class Grap extends StatefulWidget {
  // String data;
  String pressure;
  String ennergy;
  String voltage;
  String lgs;
  Grap(
      {
      // required this.data,
      required this.pressure,
      required this.ennergy,
      required this.voltage,
      required this.lgs});

  @override
  State<Grap> createState() => _GrapState();
}

var datetime = DateTime.now().year.toString() +
    DateTime.now().month.toString() +
    DateTime.now().day.toString();

int i = int.parse(datetime);
var txtDate = TextEditingController();
getdate(context) async {
  DateTime? newDateTime = await DatePicker.showDatePicker(
    context,
    locale: LocaleType.th,
    minTime: DateTime((DateTime.now().year + 543)),
    maxTime: DateTime(DateTime.now().year + 543),
  );
  print(newDateTime);
  if (newDateTime != null) {
    String date = '';
    date = newDateTime.day.toString() +
        '/' +
        newDateTime.month.toString() +
        '/' +
        (newDateTime.year).toString();
    print("date_____$date");
    // return date;
    txtDate = TextEditingController()..text = date;
  }
  // setState(() {});
}

class _GrapState extends State<Grap> {
  late TrackballBehavior _trackballBehavior;
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    txtDate.text = '';
    _tooltipBehavior = TooltipBehavior(enable: true);

    _trackballBehavior = TrackballBehavior(
        markerSettings: TrackballMarkerSettings(
            markerVisibility: TrackballVisibilityMode.visible),
        // Enables the trackball
        enable: true,
        tooltipDisplayMode: TrackballDisplayMode.floatAllPoints);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      //appBar: CustomUI.appbarUi(context),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: MyClass.backGround(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Container(
                  child: Column(
                    children: [
                      tabletMode
                          ? hSizedBox(context, 10)
                          : hSizedBox(context, displayHeight(context) * 0),
                      Container(
                        child: FutureBuilder<List<room1Model>>(
                          future: Network.fetchRoom1(context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return snapshot.data!.length > 0
                                  ? _grap(data: snapshot.data)
                                  : MyClass.loading();
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return MyClass.loading();
                          },
                        ),
                      ),
                      StreamBuilder<List<MqttReceivedMessage<MqttMessage>>>(
                        stream: Network().mqttStream('Room1/Jame'),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _card(data: snapshot.data);
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return MyClass.loading();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomUI.appbarUi(context),
          // MyClass.appbar()
        ],
      ),
    );
  }

  _grap({data}) {
    return Container(
      height: displayHeight(context) * 0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () async {
              DateTime? newDateTime = await DatePicker.showDatePicker(
                context,
                locale: LocaleType.th,
                maxTime: DateTime(DateTime.now().year + 543),
                minTime: DateTime((DateTime.now().year + 543) - 100),
              );
              if (newDateTime != null) {
                String date = '';
                date = newDateTime.day.toString() +
                    '/' +
                    newDateTime.month.toString() +
                    '/' +
                    (newDateTime.year).toString();
                // txtDateFrom = TextEditingController()..text = date;
                txtDate.text = date;
              }
            },
            icon: Icon(
              Icons.date_range_rounded,
              color: Color.fromARGB(255, 248, 103, 0),
              size: 30.0,
            ),
          ),
          Expanded(
            child: SfCartesianChart(
                trackballBehavior: _trackballBehavior,
                backgroundColor: MyColor.color('W'),
                primaryXAxis: CategoryAxis(),
                tooltipBehavior: _tooltipBehavior,
                series: <LineSeries<room1Model, String>>[
                  LineSeries<room1Model, String>(
                      markerSettings: MarkerSettings(isVisible: true),
                      dataSource: data,
                      enableTooltip: true,
                      xValueMapper: (room1Model data, _) => data.dateTime,
                      yValueMapper: (room1Model data, _) =>
                          double.parse(data.temp.toString())),
                  LineSeries<room1Model, String>(
                      markerSettings: MarkerSettings(isVisible: true),
                      dataSource: data,
                      enableTooltip: true,
                      xValueMapper: (room1Model data, _) => data.dateTime,
                      yValueMapper: (room1Model data, _) =>
                          double.parse(data.humi.toString())),
                  LineSeries<room1Model, String>(
                      markerSettings: MarkerSettings(isVisible: true),
                      dataSource: data,
                      enableTooltip: true,
                      xValueMapper: (room1Model data, _) => data.dateTime,
                      yValueMapper: (room1Model data, _) =>
                          double.parse(data.light.toString())),
                ]),
          ),
        ],
      ),
    );
  }

  _card({data}) {
    final List jsonResponse = MyClass.jsonValue(data);
    print(jsonResponse);
    return Container(
      height: displayHeight(context) * 1.0,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 3,
        ),
        children: [
          Card(
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Voltage',
                  style: CustomTextStyle.defaultCTxt(context, -1, 'Bl'),
                ),
                Center(
                  child: SimpleRadialGauge(
                    actualValue: data.isEmpty
                        ? 0.00
                        : double.parse(jsonResponse[0]['Voltage']),
                    maxValue: 1000,
                    // Optional Parameters
                    minValue: 0,
                    title: Text(''),
                    titlePosition: TitlePosition.top,
                    unit: 'V',
                    icon: Icon(Icons.power_input),
                    pointerColor: Colors.blue,
                    decimalPlaces: 0,
                    isAnimate: true,
                    animationDuration: 1000,
                    size: 150,
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Ennergy',
                  style: CustomTextStyle.defaultCTxt(context, -1, 'Bl'),
                ),
                Center(
                  child: SimpleRadialGauge(
                    actualValue: data.isEmpty
                        ? 0.00
                        : double.parse(jsonResponse[0]['Ennergy']),
                    maxValue: 1000,
                    // Optional Parameters
                    minValue: 0,
                    title: Text(''),
                    titlePosition: TitlePosition.top,
                    unit: 'V',
                    icon: Icon(Icons.power_input),
                    pointerColor: Colors.blue,
                    decimalPlaces: 0,
                    isAnimate: true,
                    animationDuration: 1000,
                    size: 150,
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Pressure',
                  style: CustomTextStyle.defaultCTxt(context, -1, 'Bl'),
                ),
                Center(
                  child: SimpleRadialGauge(
                    actualValue: data.isEmpty
                        ? 0.00
                        : double.parse(jsonResponse[0]['Pressure']),
                    maxValue: 1500,
                    // Optional Parameters
                    minValue: 0,
                    title: Text(''),
                    titlePosition: TitlePosition.top,
                    unit: 'V',
                    icon: Icon(Icons.power_input),
                    pointerColor: Colors.blue,
                    decimalPlaces: 0,
                    isAnimate: true,
                    animationDuration: 1000,
                    size: 150,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
