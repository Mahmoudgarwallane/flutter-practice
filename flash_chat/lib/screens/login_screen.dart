import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showProgress = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showProgress ,
        opacity: 0.5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: "logo",
                    child: Container(
                      height: 200,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your email"),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your password"),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  onPress: () async {
                    setState(() {
                      showProgress = true;
                    });
                    try {
                      final oldUser = await  _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);
                      if (oldUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showProgress = false;
                      });
                    }  catch (e) {
                      setState(() {
                        showProgress = false;
                      });
                      print("email or password is incorrect");
                    }
                  },
                  color: Colors.lightBlueAccent,
                  text: 'Log In',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
