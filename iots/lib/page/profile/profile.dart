// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';

// import '../../class/myclass.dart';
// import '../../class/textStyle.dart';

// List<ExpandableController> controllerList = [
//   ExpandableController(),
//   ExpandableController(),
//   ExpandableController()
// ];
// int currentIndex = -1;

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Card(
//         color: Colors.blue,
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           children: <Widget>[
//             ScrollOnExpand(
//               scrollOnExpand: true,
//               scrollOnCollapse: false,
//               child: ExpandablePanel(
//                 controller: controllerList[0],
//                 theme: const ExpandableThemeData(
//                   iconColor: Colors.white,
//                   headerAlignment: ExpandablePanelHeaderAlignment.center,
//                   tapBodyToCollapse: true,
//                 ),
//                 header: InkWell(
//                   onTap: () {
//                     currentIndex = 0;
//                     for (int i = 0; i < controllerList.length; i++) {
//                       if (i == currentIndex) {
//                         controllerList[i].expanded = true;
//                       } else {
//                         controllerList[i].expanded = false;
//                       }
//                     }
//                   },
//                   child: Container(
//                     color: Color.fromARGB(255, 97, 175, 238),
//                     child: Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Expanded(
//                                 flex: 1,
//                                 child: Icon(
//                                   Icons.account_box,
//                                   color: Colors.white,
//                                 )),
//                             // Expanded(flex: 1, child: Container()),
//                             Expanded(
//                               flex: 4,
//                               child: Text(
//                                 "ประวัติส่วนตัว",
//                                 textScaleFactor: MyClass.FontSizeApp(1.0),
//                                 style: CustomTextStyle.defaultTxt(
//                                   context,
//                                   -1,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//                 collapsed: Container(),
//                 expanded: Container(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Bill Date",
//                                 style: TextStyle(color: Colors.blue)),
//                             Text("15/05/2020",
//                                 style: TextStyle(color: Colors.blue)),
//                           ],
//                         ),
//                         Divider(
//                           color: Colors.blue,
//                           thickness: 2.0,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Adjustment",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                             Text(".00", style: TextStyle(color: Colors.blue)),
//                           ],
//                         ),
//                         Divider(
//                           color: Colors.blue,
//                           thickness: 2.0,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Total due",
//                                 style: TextStyle(color: Colors.blue)),
//                             Text("413.27",
//                                 style: TextStyle(color: Colors.blue)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 builder: (_, collapsed, expanded) {
//                   return Expandable(
//                     collapsed: collapsed,
//                     expanded: expanded,
//                     theme: const ExpandableThemeData(crossFadePoint: 0),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }



