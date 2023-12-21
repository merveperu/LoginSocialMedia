import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navigationbar.dart';
import 'google.dart';

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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg8.jpeg"),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 100.0, 0, 0),
          child: Text(
            "My App Name",
            style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255, 20, 13, 81),
              fontSize: 50,
            ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //----google sign in button----
              FlutterSocialButton(
                onTap: () {
                  signInGoogle();
                },
                buttonType:
                    ButtonType.google, // Button type for different type buttons
              ),
              //----twitter sign in button----
              Center(
                child: FlutterSocialButton(
                  onTap: () {
                    //sign in with twitter
                  },
                  buttonType: ButtonType
                      .twitter, // Button type for different type buttons
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: myTextStyleBase.size_B,
                  ),
                  Text(" "),
                  Text(
                    "Sign Up",
                    style: myTextStyleBase.size_A,
                  )
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
