//This is the page where users sign up

import 'package:flutter/material.dart';
import 'package:my_api_app/signInPage.dart';

class myTextStyleBase {
  static const size_A =
      TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(3, 7, 108, 1), fontSize: 45);
  //Header style
  static const size_B =
      TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 15);
}

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  // Initially password is obscure
  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: formArea(),
      ),
    );
  }

  //Sign Up Page
  Widget formArea() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0x79A9C6E9),
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstPage()),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text(
                        "Create Your\nAccount",
                        textAlign: TextAlign.left,
                        style: myTextStyleBase.size_A,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined),
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                            validator: (val) =>
                                val!.length < 6 ? 'Password too short.' : null,
                            onSaved: (val) => _password = val!,
                            obscureText: _obscureText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 43),
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
                        style: myTextStyleBase.size_B,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        // side: const BorderSide(
                        //   width: 2.0,
                        //   color: Color.fromARGB(255, 255, 255, 255),
                        // ),
                        backgroundColor: Color.fromRGBO(86, 91, 245, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
