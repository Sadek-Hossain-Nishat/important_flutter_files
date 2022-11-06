import 'package:flutter/material.dart';

class HompePage extends StatelessWidget {
  const HompePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 99, 212),
        body: Center(
          child: Text(
            'Home Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
            ),
          ),
        ));
  }
}
