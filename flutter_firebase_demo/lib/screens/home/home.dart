import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/models/brew.dart';
import 'package:flutter_firebase_demo/screens/home/brewList.dart';
import 'package:flutter_firebase_demo/screens/home/settingsForm.dart';
import 'package:flutter_firebase_demo/services/auth.dart';
import 'package:flutter_firebase_demo/services/database.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    
    void showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
          child: SettingsForm(),
        );
      });
    }
    
    return StreamProvider<List<Brew>>.value(
      value: DBService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('logout'),
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: ()=> showSettingsPanel(),
            ),
          ]
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/coffee_bg.png"),
                fit: BoxFit.cover,
              )
            ),
            child: BrewList()
        ),
      ),
    );
  }
}
