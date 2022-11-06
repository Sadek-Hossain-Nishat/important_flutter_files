import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:sms_autofill/sms_autofill.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        // VerificationCode(
        //   autofocus: true,
        //   textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
        //   keyboardType: TextInputType.number,
        //   underlineColor: Colors
        //       .amber, // If this is null it will use primaryColor: Colors.red from Theme
        //   length: 6,
        //   fullBorder: true,
        //   cursorColor:
        //       Colors.blue, // If this is null it will default to the ambient
        //   // clearAll is NOT required, you can delete it
        //   // takes any widget, so you can implement your design
        //   clearAll: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       'clear all',
        //       style: TextStyle(
        //           fontSize: 14.0,
        //           decoration: TextDecoration.lineThrough,
        //           color: Colors.blue[700]),
        //     ),
        //   ),
        //   onCompleted: (input) {},
        //   onEditing: (isEdit) {},
        // ),
        ElevatedButton(
            onPressed: () {
              AlertDialog alert = AlertDialog(
                content: new Row(
                  children: [
                    CircularProgressIndicator(),
                    Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Text("Loading...")),
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
            },
            child: Text('Click on')),
        Container(
          width: 250,
          child: PinFieldAutoFill(
            autoFocus: true,
            codeLength: 4,
            decoration: BoxLooseDecoration(
                strokeColorBuilder:
                    FixedColorBuilder(Colors.black.withOpacity(0.3))),
            currentCode: "1234",
            onCodeSubmitted: (code) {
              print('Code submitted= $code');
            },
            onCodeChanged: (code) {
              print(code);
            },
          ),
        )
      ],
    )));
  }
}
