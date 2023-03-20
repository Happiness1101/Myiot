import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iots/class/sizes.dart';
import 'package:readmore/readmore.dart';

import '../../class/language.dart';
import '../../class/textStyle.dart';

class Project extends StatefulWidget {
  String? lgs;
  Project({super.key, required this.lgs});

  @override
  State<Project> createState() => _ProjectState();
}

bool isReadmore = false;
final maxlines = isReadmore ? null : 3;

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(bottom: displayHeight(context) * 0.4),
            height: displayHeight(context) * 1.0,
            // color: Colors.red,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 0,
              ),
              children: [
                Expanded(
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Language.project('project', widget.lgs),
                            style:
                                CustomTextStyle.defaultCTxt(context, -1, 'Bl'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        padding: EdgeInsets.only(
                                            top: displayHeight(context) * 0.1,
                                            bottom:
                                                displayHeight(context) * 0.1),
                                        child: Image.asset(
                                          'assets/imgs/pjDiagram.jpeg',
                                        ));
                                  },
                                );
                              },
                              child: Image.asset(
                                'assets/imgs/pjDiagram.jpeg',
                                width: 200,
                                height: 200,
                              ),
                            ),
                          ),
                          ReadMoreText(
                            Language.project('projectDetail', widget.lgs),
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle:  CustomTextStyle.defaultCTxt(context, -5, 'B'),
                            lessStyle :CustomTextStyle.defaultCTxt(context, -5, 'B'),
                          ),
                          // Expanded(
                          //   child: Text(
                          //     Language.project('projectDetail', widget.lgs),
                          //     maxLines: isReadmore == true ? null : maxlines,
                          //     overflow: isReadmore == true
                          //         ? null
                          //         : TextOverflow.ellipsis,
                          //     style: CustomTextStyle.defaultTxt(context, -3),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 10),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     // crossAxisAlignment: CrossAxisAlignment.end,
                          //     children: [
                          //       TextButton(
                          //         onPressed: () {
                          //           setState(() {
                          //             isReadmore = !isReadmore;
                          //           });

                          //           print(isReadmore);
                          //         },
                          //         child: Text(
                          //           Language.project('readMore', widget.lgs),
                          //           // maxLines:
                          //           //     isReadmore == true ? null : maxlines,
                          //           // overflow: TextOverflow.ellipsis,
                          //           textAlign: TextAlign.left,
                          //           style: CustomTextStyle.defaultTxtUl(
                          //               context, -3),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class WorkModel {
  String title;
  String photo;

  WorkModel(
    this.title,
    this.photo,
  );
}
