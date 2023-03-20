import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iots/class/customUI.dart';
import 'package:iots/class/language.dart';
import 'package:iots/page/mainmenu.dart';
import 'package:iots/page/profile/profile.dart';
import 'package:iots/page/profile/project.dart';
import 'package:iots/page/profile/reward.dart';
import 'package:iots/service/network.dart';

import '../../class/myclass.dart';
import '../../class/sizes.dart';
import '../../class/textStyle.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<String> menu = [
    'Profile',
    'Reward',
    'Project',
  ];

  var _tabIndex = 0;
  @override
  void initState() {
    // Network.fetchMRoom1;
    // TODO: implement initState
    super.initState();
  }

  final _kTabs = <Tab>[
    Tab(text: 'NK'),
    Tab(text: 'ActiveTools'),
    Tab(text: 'Coxmate'),
    Tab(text: 'Concept2'),
    Tab(text: 'Croker'),
    Tab(text: 'Hudson'),
    Tab(text: 'Swift'),
    Tab(text: 'Rowshop'),
  ];

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Stack(
      children: [
        Container(
          decoration: MyClass.backGround(),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: displayHeight(context) * 0.25),
        //   child: TabBarView(
        //     physics: NeverScrollableScrollPhysics(),
        //     children: [
        //       Text(
        //         'data',
        //         textScaleFactor: MyClass.FontSizeApp(1.0),
        //         style: CustomTextStyle.defaultCTxt(context, 0, 'Bl'),
        //       )
        //     ],
        //   ),
        // ),
        Container(
          padding: EdgeInsets.only(
              top: displayHeight(context) * (tabletMode ? 0.0 : 0.0)),
          child: DefaultTabController(
            length: menu.length,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: displayHeight(context) * 0.25),
                  child: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              menu[0],
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultCTxt(
                                  context, -1, 'Bl'),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              menu[1],
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultCTxt(
                                  context, -1, 'Bl'),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              menu[2],
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultCTxt(
                                  context, -1, 'Bl'),
                            ),
                          ),
                        ),
                      ),
                    ],
                    onTap: (value) {
                      _tabIndex = value;
                    },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Center(
                        child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                                bottom: displayHeight(context) * 0.5),
                            child: _profile()),
                      ),
                      Center(
                        child: SingleChildScrollView(
                            padding: EdgeInsets.only(
                                bottom: displayHeight(context) * 0.5),
                            child: Reward(lgs: lgs,)),
                      ),
                         Center(
                        child: SingleChildScrollView(
                           
                            child: Project(lgs: lgs,)),
                      ),
                      // Center(
                      //   child: SingleChildScrollView(
                      //     padding: EdgeInsets.only(
                      //         bottom: displayHeight(context) * 0.5),
                      //     child: Container(
                      //       color: Colors.green,
                      //       child: Text(
                      //         'data',
                      //         textScaleFactor: MyClass.FontSizeApp(1.0),
                      //         style: CustomTextStyle.defaultCTxt(
                      //             context, -1, 'Bl'),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Expanded(
        //   child: TabBarView(
        //     physics: NeverScrollableScrollPhysics(),
        //     children: <Widget>[
        //       Center(
        //         child: SingleChildScrollView(
        //           padding:
        //               EdgeInsets.only(bottom: displayHeight(context) * 0.5),
        //           // child: _kTabs
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        CustomUI.appbarDetailUi('assets/imgs/boy.jpg', context),
      ],
    );
  }

  _profile() {
    return Container(
      width: displayWidth(context) * 1.0,
      height: displayHeight(context) * 1.0,
      child: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Profile(),
            Myjob(),
            Skill(),
          ],
        ),
      ),
    );
  }
}

List<ExpandableController> controllerList = [
  ExpandableController(),
  ExpandableController(),
  ExpandableController()
];
int currentIndex = -1;

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.blue,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                controller: controllerList[0],
                theme: const ExpandableThemeData(
                  iconColor: Colors.white,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: InkWell(
                  onTap: () {
                    currentIndex = 0;
                    for (int i = 0; i < controllerList.length; i++) {
                      if (i == currentIndex) {
                        controllerList[i].expanded = true;
                      } else {
                        controllerList[i].expanded = false;
                      }
                    }
                  },
                  child: Container(
                    color: Color.fromARGB(255, 97, 175, 238),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.account_box,
                                  color: Colors.white,
                                )),
                            // Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "ประวัติส่วนตัว",
                                textScaleFactor: MyClass.FontSizeApp(1.0),
                                style: CustomTextStyle.defaultCTxt(
                                    context, -1, 'Bl'),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                collapsed: Container(),
                expanded: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language.profile('name', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                            Text(
                              Language.profile('myName', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language.profile('nickName', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                            Text(
                              Language.profile('mynickName', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language.profile('dateOfbirth', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                            Text(
                              '13/12/1995',
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language.profile('age', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                            Text(
                              '27',
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.blue,
                          thickness: 2.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  Language.profile('university', lgs),
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                                Text(
                                  Language.profile('group', lgs),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                                Text(
                                  '2.64',
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.blue,
                          thickness: 2.0,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Language.profile('email', lgs),
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                                Text(
                                  'Jame.bunditchai@gmail.com',
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  Language.profile('phone', lgs),
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                                Text(
                                  '065-910-8623',
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                builder: (_, collapsed, expanded) {
                  return Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Myjob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.blue,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                controller: controllerList[1],
                theme: const ExpandableThemeData(
                  iconColor: Colors.white,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: InkWell(
                  onTap: () {
                    currentIndex = 0;
                    for (int i = 0; i < controllerList.length; i++) {
                      if (i == currentIndex) {
                        controllerList[i].expanded = true;
                      } else {
                        controllerList[i].expanded = false;
                      }
                    }
                  },
                  child: Container(
                    color: Color.fromARGB(255, 97, 175, 238),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.wordpress,
                                  color: Colors.white,
                                )),
                            // Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "ประวัติการทำงาน",
                                textScaleFactor: MyClass.FontSizeApp(1.0),
                                style: CustomTextStyle.defaultCTxt(
                                    context, -1, 'Bl'),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                collapsed: Container(),
                expanded: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language.myJob('company', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                            Text(
                              'Soat-Solution',
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language.myJob('experience', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                            Text(
                              '2 ปี',
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Language.myJob('jobPosition', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                            Text(
                              Language.myJob('Mobile', lgs),
                              textScaleFactor: MyClass.FontSizeApp(1.0),
                              style: CustomTextStyle.defaultTxtCc(
                                  context, -5, 'Bl'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                Language.myJob('detail', lgs),
                                textScaleFactor: MyClass.FontSizeApp(1.0),
                                style: CustomTextStyle.defaultTxtCc(
                                    context, -5, 'Bl'),
                              ),
                            ),
                          ],
                        )
                        // Divider(
                        //   color: Colors.blue,
                        //   thickness: 2.0,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Adjustment",
                        //       style: TextStyle(color: Colors.blue),
                        //     ),
                        //     Text(".00", style: TextStyle(color: Colors.blue)),
                        //   ],
                        // ),
                        // Divider(
                        //   color: Colors.blue,
                        //   thickness: 2.0,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text("Total due",
                        //         style: TextStyle(color: Colors.blue)),
                        //     Text("413.27",
                        //         style: TextStyle(color: Colors.blue)),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                builder: (_, collapsed, expanded) {
                  return Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Skill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.blue,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                controller: controllerList[2],
                theme: const ExpandableThemeData(
                  iconColor: Colors.white,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: InkWell(
                  onTap: () {
                    currentIndex = 0;
                    for (int i = 0; i < controllerList.length; i++) {
                      if (i == currentIndex) {
                        controllerList[i].expanded = true;
                      } else {
                        controllerList[i].expanded = false;
                      }
                    }
                  },
                  child: Container(
                    color: Color.fromARGB(255, 97, 175, 238),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.workspaces,
                                  color: Colors.white,
                                )),
                            // Expanded(flex: 1, child: Container()),
                            Expanded(
                              flex: 4,
                              child: Text(
                                Language.skill('skill', lgs),
                                textScaleFactor: MyClass.FontSizeApp(1.0),
                                style: CustomTextStyle.defaultTxtCc(
                                    context, -1, 'Bl'),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                collapsed: Container(),
                expanded: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Language.skill('mainSkill', lgs),
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -4, 'Bl'),
                                ),
                                Text(
                                  'dart, mySQL , OOP',
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.blue,
                          thickness: 2.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Language.skill('secondarySkill', lgs),
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -4, 'Bl'),
                                ),
                                Text(
                                  'php, arduino',
                                  textScaleFactor: MyClass.FontSizeApp(1.0),
                                  style: CustomTextStyle.defaultTxtCc(
                                      context, -5, 'Bl'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Divider(
                        //   color: Colors.blue,
                        //   thickness: 2.0,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text("Total due",
                        //         style: TextStyle(color: Colors.blue)),
                        //     Text("413.27",
                        //         style: TextStyle(color: Colors.blue)),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                builder: (_, collapsed, expanded) {
                  return Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
