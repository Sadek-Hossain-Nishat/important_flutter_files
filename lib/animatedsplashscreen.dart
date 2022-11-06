import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AnimatedSplashScreenFlutter());
}

class AnimatedSplashScreenFlutter extends StatelessWidget {
  const AnimatedSplashScreenFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageforAnimatedSplashScreen(),
    );
  }
}

class HomePageforAnimatedSplashScreen extends StatefulWidget {
  const HomePageforAnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  _HomePageforAnimatedSplashScreenState createState() =>
      _HomePageforAnimatedSplashScreenState();
}

class _HomePageforAnimatedSplashScreenState
    extends State<HomePageforAnimatedSplashScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ad_units_rounded),
          onPressed: () {
            setState(() {
              value = !value;
            });
          }),
      body: Container(
        child: FlareActor(
          'animation/resizinghouse.flr',
          alignment: Alignment.center,
          fit: BoxFit.cover,
          animation: value == false ? 'Demo Mode' : 'Sun Rotate',
        ),
      ),
    ));
  }
}
