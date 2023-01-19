import 'package:debate_timer/timer_page.dart';
import 'package:debate_timer/widget/custom_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAC IIITV-ICD Debate Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: TimerPage(
      //   forr: "",
      //   against: "",
      // ),
      home: const MyHomePage(title: 'SAC IIITV-ICD Debate Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String teamFor = "";
    String teamAgainst = "";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade400,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.5,
              // width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/Debate.png',
                fit: BoxFit.fill,
                // colorBlendMode: BlendMode.saturation,
                // color: Colors.grey,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    custom_box(text: "For : "),
                    Container(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextField(
                        onChanged: (value) {
                          teamFor = value;
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    custom_box(text: "Against : "),
                    Container(
                      // color: Colors.blueAccent,
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextField(
                        onChanged: (value) {
                          teamAgainst = value;
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
            custom_box(text: "RULES"),
            SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('''
1. Each debate will last for 10 minutes(5 minutes for each team).\n
2. 5 minutes are distributed in segments of 2+2+1.\n
3. 2-2 minutes for each speaker and 1 minute for the conclusion.\n
4. Individual scores will be given to both members which will sum up the team score.\n
5. Random topics and motions will be assigned to each team 30 minutes prior to the commencement of the first debate. These 30 minutes can be used by the participating teams for discussion.\n
6. The use of digital devices is not permitted after the commencement of the first debate.\n
7. The top 6 teams will qualify for round 2.\n
'''),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              child: custom_box(text: "START !"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TimerPage(forr: teamFor, against: teamAgainst)));
              },
            ),
            SizedBox(height: 30),
            Container(
              color: Colors.grey.shade400,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.5,
              child: Image.asset(
                'images/footer.jpg',
                fit: BoxFit.fill,
                // colorBlendMode: BlendMode.saturation,
                // color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
