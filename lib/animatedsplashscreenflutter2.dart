import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practiceflutter/homepagesplashscreen.dart';

void main(List<String> args) {
  runApp(AnimatedSplashScreenFlutter2());
}

class AnimatedSplashScreenFlutter2 extends StatelessWidget {
  const AnimatedSplashScreenFlutter2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageforAnimatedSplashScreen2(),
    );
  }
}

class HomePageforAnimatedSplashScreen2 extends StatefulWidget {
  const HomePageforAnimatedSplashScreen2({Key? key}) : super(key: key);

  @override
  State<HomePageforAnimatedSplashScreen2> createState() =>
      _HomePageforAnimatedSplashScreen2State();
}

class _HomePageforAnimatedSplashScreen2State
    extends State<HomePageforAnimatedSplashScreen2> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 10), () {
      Navigator.push(context,
          CupertinoPageRoute(builder: (context) => HomepageSplashScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FlareActor(
        'animation/resizinghouse.flr',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: 'Demo Mode',
      ),
    ));
  }
}
