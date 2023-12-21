import 'package:flutter/material.dart';
import 'package:my_api_app/random_jokes.dart';
import 'signInPage.dart';
import 'package:intl/intl.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:lottie/lottie.dart';
import "google.dart";

DateTime now = DateTime.now();
var formatter = DateFormat('E, d MMM yyyy');
String formattedDate = formatter.format(now);

var my_background = const AssetImage("assets/images/bg8.jpeg");
bool isSwitched = false;
const Color first_color = Color.fromARGB(255, 20, 13, 81);

class myTextStyleTwo {
  static var size_A = const TextStyle(
      fontWeight: FontWeight.w600, color: first_color, fontSize: 30);
  static var size_B = const TextStyle(
      fontWeight: FontWeight.w400, color: first_color, fontSize: 15);
  static var size_C = const TextStyle(
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(209, 255, 255, 255),
      fontSize: 20);
  static var size_D = const TextStyle(
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(209, 255, 255, 255),
      fontSize: 15);
}

//-----The page after user loged in----
class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  void initState() {
    // TODO: implement initState
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: my_background, fit: BoxFit.cover)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 60.0, 0, 0),
          child: Text(
            "Welcome, " + my_user!.displayName.toString(),
            style: myTextStyleTwo.size_A,
          ),
        ),
        //----date text----
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 100.0, 0, 0),
          child: Text(
            formattedDate,
            style: myTextStyleTwo.size_B,
          ),
        ), // 2016-01-25),
        //----user profile picture----
        Padding(
          padding: EdgeInsets.fromLTRB(300.0, 65.0, 0, 0),
          child: CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(my_user!.photoURL.toString()),
          ),
        ),
        //----switch for background----
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 120.0, 0, 0),
          child: Switch(
            activeColor: Color.fromARGB(255, 20, 13, 81),
            activeTrackColor: Colors.grey.shade400,
            inactiveThumbColor: Color.fromARGB(255, 20, 13, 81),
            inactiveTrackColor: Colors.grey.shade400,
            splashRadius: 20.0,
            // boolean variable value
            value: isSwitched,
            // changes the state of the switch
            onChanged: (value) => setState(() {
              if (isSwitched != false) {
                my_background = AssetImage("assets/images/bg8.jpeg");
              } else {
                my_background = AssetImage("assets/images/bg19.jpeg");
              }
              isSwitched = value;
            }),
          ),
        ),
        //----log out button----
        Center(
          child: TextButton(
              onPressed: () {
                signOutGoogle();
              },
              child: Text("log out")),
        ),
        //---- scroll----
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 460, 0, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 20, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "What Do You Need Today?",
                    style: myTextStyleTwo.size_C,
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      child: Container(
                        width: 280,
                        color: Color.fromARGB(104, 145, 196, 240),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 205,
                              child: Lottie.asset(
                                  "assets/animations/animation5.json"),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        print("container tıklandı");
                        random_jokes();
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      child: Container(
                        width: 280,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 207,
                              child: Lottie.asset(
                                  "assets/animations/infoanimation3.json"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, //Center Row contents horizontally,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 280,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
