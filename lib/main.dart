import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Json",
    theme: ThemeData(
      primarySwatch: Colors.cyan,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        builder: (context, snapshot) {
          var myData = json.decode(snapshot.data.toString());
          if (myData == null) {
            return Center(
              child: Text(
                'load',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                myData['items'][0]['name'],
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
