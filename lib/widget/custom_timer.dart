// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:avatar_glow/avatar_glow.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:debate_timer/widget/custom_textbox.dart';
import 'package:flutter/material.dart';

class customTimer extends StatefulWidget {
  int time;
  customTimer({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  State<customTimer> createState() => _customTimerState();
}

class _customTimerState extends State<customTimer>
    with TickerProviderStateMixin {
  late CustomTimerController _controllerTeam1 = CustomTimerController(
      vsync: this,
      begin: Duration(minutes: widget.time),
      end: Duration(),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.milliseconds);
  late CustomTimerController _controllerTeam2 = CustomTimerController(
      vsync: this,
      begin: Duration(minutes: widget.time),
      end: Duration(),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.milliseconds);

  bool team1flag = false;
  bool team2flag = false;

  @override
  void dispose() {
    _controllerTeam1.dispose();
    _controllerTeam2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            AvatarGlow(
              endRadius: MediaQuery.of(context).size.width / 7,
              curve: Curves.easeInOutCubicEmphasized,
              shape: BoxShape.circle,
              glowColor:
                  team1flag ? Color.fromARGB(255, 9, 181, 75) : Colors.white,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(217, 217, 217, 1),
                          border: Border.all(color: Colors.black),
                        ),
                        child: CustomTimer(
                            controller: _controllerTeam1,
                            builder: (state, time) {
                              // Build the widget you want!🎉
                              return Text("${time.minutes}:${time.seconds}",
                                  textScaleFactor: 8,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold));
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 10, top: 10),
                      child: GestureDetector(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 13,
                          width: MediaQuery.of(context).size.width / 6,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 175, 41, 77),
                            border: Border.all(color: Colors.black),
                          ),
                          child: team1flag
                              ? custom_text(text: "PAUSE")
                              : custom_text(text: "START"),
                        ),
                        onTap: () {
                          print("Team1");
                          team1flag
                              ? _controllerTeam1.pause()
                              : _controllerTeam1.start();
                          setState(() {
                            team1flag ? team1flag = false : team1flag = true;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            //
            AvatarGlow(
              endRadius: MediaQuery.of(context).size.width / 7,
              curve: Curves.easeInOutCubicEmphasized,
              glowColor:
                  team2flag ? Color.fromARGB(255, 9, 181, 75) : Colors.white,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(217, 217, 217, 1),
                          border: Border.all(color: Colors.black),
                        ),
                        child: CustomTimer(
                            controller: _controllerTeam2,
                            builder: (state, time) {
                              // Build the widget you want!🎉
                              return Text("${time.minutes}:${time.seconds}",
                                  textScaleFactor: 8,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold));
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 10, top: 10),
                      child: GestureDetector(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 13,
                          width: MediaQuery.of(context).size.width / 6,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(175, 41, 77, 1),
                            border: Border.all(color: Colors.black),
                          ),
                          child: team2flag
                              ? custom_text(text: "PAUSE")
                              : custom_text(text: "START"),
                        ),
                        onTap: () {
                          print("Team2");
                          team2flag
                              ? _controllerTeam2.pause()
                              : _controllerTeam2.start();
                          setState(() {
                            team2flag ? team2flag = false : team2flag = true;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
