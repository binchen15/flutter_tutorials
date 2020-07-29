import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter_firebase_demo/services/auth.dart';
import 'package:flutter_firebase_demo/shared/constants.dart';
import 'package:flutter_firebase_demo/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleState;

  SignIn({this.toggleState});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sign In"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("register"),
            onPressed: (){
              widget.toggleState();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height:20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? "Enter a valid email" : null,
                onChanged: (val) {
                  setState((){
                    email = val;
                  });
                },
              ),
              SizedBox(height:20),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (val) => val.length < 6 ? "require 6 char mininum" : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  }
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    print("valid");
                    dynamic result = await _auth.signInEmailPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = "Please supply a valid email/password";
                      });
                    };
                    print(email);
                    print(password);
                  }
                }
              ),
              SizedBox(height: 12,),
              Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  )
              )
            ],
          ),
        )
      ),
    );
  }
}

