import 'package:flutter/material.dart';


class PageB extends StatefulWidget {
var stateData;
PageB(this.stateData);

  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.stateData.toString()),
      ),
    );
  }
}