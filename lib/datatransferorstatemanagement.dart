import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practiceflutter/pageA.dart';
import 'package:practiceflutter/pageB.dart';

void main(List<String> args) {
  runApp(StateManagementFlutter());
}

class StateManagementFlutter extends StatelessWidget {
  const StateManagementFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageforStateManagement(),
    );
  }
}

class HomePageforStateManagement extends StatefulWidget {
  const HomePageforStateManagement({Key? key}) : super(key: key);

  @override
  _HomePageforStateManagementState createState() =>
      _HomePageforStateManagementState();
}

class _HomePageforStateManagementState
    extends State<HomePageforStateManagement> {
  var _name = "sadek Hossain Nishat";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => PageA(_name)));

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageB(_name)));
              },
              child: Text('Click On'))),
    ));
  }
}
