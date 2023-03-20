import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:iots/bloc/iot_bloc.dart';
import 'package:iots/class/mycolor.dart';
import 'package:iots/page/room1/page1.dart';
import 'package:iots/page/profile/page2.dart';

class Mainmenu extends StatefulWidget {
  const Mainmenu({super.key});

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

String? lgs = 'th';
bool isOn = false;

int _selectedPage = 0;

final _page = [
  Page1(),
  Page2(),
];

// final _route = <String, WidgetBuilder>{
//   '/page1': (BuildContext context) => Page1(),
//   '/page2': (BuildContext context) => Page2()
// };

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              
                setState(() {
                  isOn = val;
                  lgs = 'en';
                });
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
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                // decoration: BoxDecoration(
                //   color: Colors.blue,
                // ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Page 1'),
                onTap: () {
                  _selectedPage = 0;
                  setState(() {});
                  Navigator.pop(context);
                  print(_selectedPage);
                  //  Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Page1()),
                  // );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_camera_front_rounded,
                ),
                title: const Text('Page 2'),
                onTap: () {
                  print(_selectedPage);
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Page2()),
                  // );
                  _selectedPage = 1;
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: _page[_selectedPage]);
  }
}
