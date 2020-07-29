import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import "package:world_time/services/world_time.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading time...";

  void setupWorldTime() async {
    WorldTime wt =
        WorldTime(location: "London", url: "Europe/London", flag: "London.png");
    await wt.getTime();
    setState(() {
      time = wt.time;
    });
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'time': wt.time,
      'location': wt.location,
      'flag': wt.flag,
      'isDaytime': wt.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
