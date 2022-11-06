import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practiceflutter/flutterfirebase/userauth/googlesignin/GoogleSignInPage.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/HomeofPhoneVerificationUser.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/NewScreen.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/PhoneNumberScreen.dart';

void main(List<String> args) {
  runApp(MainStateless());
}

class MainStateless extends StatelessWidget {
  const MainStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: TestinginthisModule());
  }
}

class TestinginthisModule extends StatefulWidget {
  const TestinginthisModule({Key? key}) : super(key: key);

  @override
  State<TestinginthisModule> createState() => _TestinginthisModuleState();
}

class _TestinginthisModuleState extends State<TestinginthisModule> {
  showDialogLoader(BuildContext context) {
    print("context = $context");
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      showDialogLoader(context);
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NewScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Image.asset(
                'images/googlelogo.png',
                height: 200,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
