import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:iots/bloc/iot_bloc.dart';
import 'package:iots/class/mycolor.dart';
import 'package:iots/page/room1/room.dart';
import 'package:iots/page/profile/profile.dart';

class Mainmenu extends StatefulWidget {
  const Mainmenu({super.key});

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

String? lgs = 'th';
// bool _switchValue = false;

int _selectedPage = 0;

final _page = [
  Page1(),
  Page2(),
];

class _MainmenuState extends State<Mainmenu> {
  final loginBloc = BlocProvider(create: (context) => LoginBloc());
  final lgsBloc = BlocProvider(create: (context) => LgsBloc());
  bool _switchValue = false;
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
              inactiveColor: Color.fromARGB(255, 18, 140, 240),
              // activeTextColor: MyColor.color('B'),
              toggleColor: MyColor.color('B'),
              inactiveToggleColor: MyColor.color('B'),
              activeToggleColor: MyColor.color('B'),
              inactiveText: 'EN',
              activeText: 'TH',
              value: _switchValue,
              showOnOff: true,
              onToggle: (val) {
                if (val == true) {
                  print('val == true');
                  context.read<LgsBloc>().add(LgsEventAdd());
                } else {
                  print('val == false');
                  context.read<LgsBloc>().add(LgsEventRemove());
                }

                // BlocProvider.of<LgsBloc>(context).add(LgsEvent(bools: val));
                print(_switchValue);
                setState(() {
                  _switchValue = val;
                });

                // final lgsBloc = BlocProvider(create: (context) => LgsBloc());
                // print(lgsBloc);
                // print(context.read<LgsBloc>().state.lgs.toString());
              },
            ),
            // FlutterSwitch(
            //   inactiveColor: Color.fromARGB(255, 18, 140, 240),
            //   // activeTextColor: MyColor.color('B'),
            //   toggleColor: MyColor.color('B'),
            //   inactiveToggleColor: MyColor.color('B'),
            //   activeToggleColor: MyColor.color('B'),
            //   inactiveText: 'EN',
            //   activeText: 'TH',
            //   value: _switchValue,
            //   showOnOff: true,
            //   onToggle: (val) {
            //     context.read<LgsBloc>().add(LgsEvent(bools: val));
            //     // BlocProvider.of<LgsBloc>(context).add(LgsEvent(bools: val));
            //     print(_switchValue);
            //     setState(() {
            //       _switchValue = val;
            //     });

            //     // final lgsBloc = BlocProvider(create: (context) => LgsBloc());
            //     // print(context.read<LgsBloc>().state.lgs.toString());
            //   },
            // )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Drawer Header'),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Room'),
                onTap: () {
                  _selectedPage = 0;
                  setState(() {});
                  Navigator.pop(context);
                  print(_selectedPage);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_camera_front_rounded,
                ),
                title: const Text('Profile'),
                onTap: () {
                  print(_selectedPage);
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
