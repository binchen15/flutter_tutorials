import "package:flutter/material.dart";
import 'package:flutter_firebase_demo/services/signin.dart';
import 'package:flutter_firebase_demo/services/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleState() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn ? SignIn(toggleState:toggleState) : Register(toggleState:toggleState),
    );
  }
}
