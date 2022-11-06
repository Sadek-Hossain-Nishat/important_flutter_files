import 'package:flutter/material.dart';

class HomepageSplashScreen extends StatelessWidget {
  const HomepageSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Homepage',
            style: TextStyle(fontSize: 50, color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
