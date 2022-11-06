import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  var name;

  PageA(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(name.toString()),
      ),
    );
  }
}
