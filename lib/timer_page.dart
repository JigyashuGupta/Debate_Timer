import 'dart:html';

import 'package:debate_timer/widget/custom_textbox.dart';
import 'package:debate_timer/widget/custom_timer.dart';
import 'package:debate_timer/widget/custom_timer_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_keyboard_shortcuts/keyboard_shortcuts.dart';

class TimerPage extends StatefulWidget {
  final String? forr;
  final String? against;
  TimerPage({Key? key, this.forr, this.against}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(175, 41, 77, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.forr!),
            Text("VS"),
            Text(widget.against!),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Visibility(
            replacement: SizedBox.fromSize(size: Size.zero),
            visible: counter % 4 == 0,
            child: Column(
              children: [
                const Text(
                  "ROUND 1",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 3,
                ),
                customTimer(time: 2),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 175, 41, 77),
                      border: Border.all(color: Colors.black),
                    ),
                    child: custom_text(
                      text: "NEXT ROUND",
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                )
              ],
            ),
          ),
          Visibility(
            visible: counter % 4 == 1,
            child: Column(
              children: [
                const Text(
                  "ROUND 2",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 3,
                ),
                customTimer2(time: 3),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 175, 41, 77),
                      border: Border.all(color: Colors.black),
                    ),
                    child: custom_text(
                      text: "NEXT ROUND",
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                )
              ],
            ),
          ),
          Visibility(
            visible: counter % 4 == 2,
            child: Column(
              children: [
                const Text(
                  "ROUND 3",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 3,
                ),
                customTimer(time: 2),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 175, 41, 77),
                      border: Border.all(color: Colors.black),
                    ),
                    child: custom_text(
                      text: "NEXT ROUND",
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                )
              ],
            ),
          ),
          Visibility(
            visible: counter % 4 == 3,
            child: Column(
              children: [
                const Text(
                  "ROUND 4",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 3,
                ),
                customTimer(time: 1),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 175, 41, 77),
                      border: Border.all(color: Colors.black),
                    ),
                    child: custom_text(
                      text: "NEXT ROUND",
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                )
              ],
            ),
          ),
          KeyBoardShortcuts(
              keysToPress: {LogicalKeyboardKey.enter},
              onKeysPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Container()),
          KeyBoardShortcuts(
              keysToPress: {LogicalKeyboardKey.keyN},
              onKeysPressed: () {
                Navigator.pop(context);
              },
              child: Container()),
        ],
      ),
    );
  }
}
