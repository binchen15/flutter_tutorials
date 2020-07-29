import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase_demo/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_demo/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // print(user);
    return user== null? Authenticate() : Home();
  }
}
