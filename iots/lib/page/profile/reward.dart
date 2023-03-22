import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iots/class/sizes.dart';

import '../../class/language.dart';
import '../../class/textStyle.dart';

class Reward extends StatefulWidget {
  String? lgs;
  Reward({super.key, required this.lgs});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
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
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Language.reward('contest', widget.lgs),
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
                                          top: displayHeight(context) * 0.3,
                                          bottom:
                                              displayHeight(context) * 0.3),
                                      child: Image.asset(
                                        'assets/imgs/central.jpeg',
                                      ));
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/imgs/central.jpeg',
                            ),
                          ),
                        ),
                     Expanded(
                          child: Text(
                            Language.reward('contestDetail', widget.lgs),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyle.defaultTxt(context, -3),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  Language.reward('readMore', widget.lgs),
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      CustomTextStyle.defaultTxtUl(context, -3),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
               Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Language.reward('bootcam', widget.lgs),
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
                                            top: displayHeight(context) * 0.3,
                                            bottom:
                                                displayHeight(context) * 0.3),
                                        child: Image.asset(
                                          'assets/imgs/smartFram.jpg',
                                        ));
                                  },
                                );
                              },
                              child: Image.asset(
                                'assets/imgs/smartFram.jpg',
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              Language.reward('contestDetail', widget.lgs),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyle.defaultTxt(context, -3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    Language.reward('readMore', widget.lgs),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        CustomTextStyle.defaultTxtUl(context, -3),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            )
           
            ),
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
