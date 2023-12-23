import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_api_app/signUpPage.dart';
import 'navigationbar.dart';
import 'google.dart';
import 'signUpPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
User? _user;
final my_user = _auth.currentUser;

//-----text styles in a class-----
class myTextStyleBase {
  static const size_A =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
  static const size_B =
      TextStyle(fontWeight: FontWeight.normal, color: Colors.white);
}

//----Print console if user is loged in----
void checkUser() {
  _auth.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

//----gets the info of current user----
void getUserInfo() {
  final my_user = _auth.currentUser;
  if (my_user != null) {
    // Name, email address, and profile photo URL
    final name = my_user.displayName;
    final email = my_user.email;
    final photoUrl = my_user.photoURL;
    final uid = my_user.uid;
    print("name: " +
        name.toString() +
        " email:" +
        email.toString() +
        " photo url: " +
        photoUrl.toString() +
        " uid: " +
        uid.toString());
  } else {
    print("user is null");
  }
}

//------------end of google functions--------------

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    getUserInfo();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
    //prints current situation of user
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      //If user is not null app goes to mainPage,
      //if user is defined app shows login page which is signInPage
      body: _user != null ? navigationBar() : signInPage(),
      //body: signInPage(),
    );
  }

  //-----design of the sign in page here-----
  Widget signInPage() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            //image: DecorationImage(image: AssetImage("assets/images/bg2.jpg"), fit: BoxFit.cover)
            color: Color(0x79A9C6E9),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Hello There!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(3, 7, 108, 1)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Curabitur at risus risus. Integer placerat mi non velit posuere, vel volutpat urna luctus. Vestibulum ante ipsum primis in faucibus.!",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Color.fromRGBO(3, 7, 108, 1)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        //----image----
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/signup3.png"))),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //----log in button----
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    side: const BorderSide(
                      width: 2.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    backgroundColor: Color.fromRGBO(86, 91, 245, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                ),
              ),
              //----sign up button----
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const signUpPage()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    side: const BorderSide(
                      width: 2.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    backgroundColor: Color.fromRGBO(86, 91, 245, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                ),
              ),

              //----google sign in button----
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: FlutterSocialButton(
                  onTap: () {
                    signInGoogle();
                  },
                  buttonType: ButtonType
                      .google, // Button type for different type buttons
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
