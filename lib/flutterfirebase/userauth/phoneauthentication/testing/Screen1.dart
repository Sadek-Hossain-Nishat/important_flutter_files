import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/testing/Screen2.dart';

void main(List<String> args) {
  runApp(Screen1());
}

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Homepageforscreen1());
  }
}

class Homepageforscreen1 extends StatefulWidget {
  const Homepageforscreen1({Key? key}) : super(key: key);

  @override
  State<Homepageforscreen1> createState() => _Homepageforscreen1State();
}

class _Homepageforscreen1State extends State<Homepageforscreen1> {
  bool showprogressindicator = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Screen1'),
      ),
      body: Center(
        child: showprogressindicator
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  Timer(Duration(seconds: 0), () {
                    setState(() {
                      showprogressindicator = true;
                    });
                    Timer(Duration(seconds: 5), () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Screen2()));
                    });
                  });
                },
                child: Text('Go to Screen 1')),
      ),
    ));
  }
}
