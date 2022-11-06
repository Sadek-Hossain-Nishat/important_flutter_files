import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:practiceflutter/onboardingscreenpackage/HomepageAfterOnboardingScreen.dart';

void main(List<String> args) {
  runApp(IntroductionscreenFlutter());
}

class IntroductionscreenFlutter extends StatelessWidget {
  const IntroductionscreenFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforintroductionscreen(),
    );
  }
}

class Homepageforintroductionscreen extends StatefulWidget {
  const Homepageforintroductionscreen({Key? key}) : super(key: key);

  @override
  State<Homepageforintroductionscreen> createState() =>
      _HomepageforintroductionscreenState();
}

class _HomepageforintroductionscreenState
    extends State<Homepageforintroductionscreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'First',
            body: 'This is First Description',
            image: Image.asset(
              'images/img1.jpg',
              width: 350,
            )),
        PageViewModel(
            title: 'Second',
            body: 'This is Second Description',
            image: Image.asset(
              'images/img2.jpg',
              width: 350,
            )),
        PageViewModel(
            title: 'Third',
            body: 'This is Third Description',
            image: Image.asset(
              'images/img3.jpg',
              width: 350,
            ))
      ],
      done: Text('Done'),
      onDone: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomepageAfterOnboardingScreen()));
      },
      next: Text('Next'),
      showNextButton: true,
      back: Text('Back'),
      showBackButton: true,
    );
  }
}
