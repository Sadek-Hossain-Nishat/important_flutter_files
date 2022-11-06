import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  var receivedata;

  DetailsPage(this.receivedata);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          radius: 50,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image.network(receivedata["avatar"])),
        ),
      ),
    );
  }
}
