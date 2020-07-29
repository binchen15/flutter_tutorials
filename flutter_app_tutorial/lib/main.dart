import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dart App'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.cyan,
              child: Text('One'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
            padding: EdgeInsets.all(30),
            color: Colors.amber,
            child: Text('Two'),
          )),
          Expanded(
            flex: 1,
            child: Container(
            padding: EdgeInsets.all(40),
            color: Colors.pinkAccent,
            child: Text('Three'),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.red[600],
        child: Text('Click'),
      ),
    );
  }
}


