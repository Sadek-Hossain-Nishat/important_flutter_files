import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/testing/Screen3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool showprogressindicator = false;
  @override
  void initState() {
    executation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: Center(
        child: showprogressindicator
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  executation();
                },
                child: Text('Go to Screen 3')),
      ),
    ));
  }

  void executation() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        showprogressindicator = true;
      });
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Screen3()));
      });
    });
  }
}
