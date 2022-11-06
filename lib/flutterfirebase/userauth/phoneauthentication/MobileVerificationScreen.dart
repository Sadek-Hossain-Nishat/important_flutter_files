import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/HomeofPhoneVerificationUser.dart';
import 'package:sms_autofill/sms_autofill.dart';

class MobileVerificationScreen extends StatefulWidget {
  var phoneNumber;

  MobileVerificationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<MobileVerificationScreen> createState() =>
      _MobileVerificationScreenState(phoneNumber);
}

class _MobileVerificationScreenState extends State<MobileVerificationScreen> {
  var phoneNumber;

  String _code = '';
  bool btndisable = true;
  bool isResend = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool showprogressindicatior = false;
  String _verificationId = '';

  _MobileVerificationScreenState(this.phoneNumber);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(phoneNumber);

    codeVerification(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text('OTP Verification'),
            centerTitle: true,
          ),
          body: Center(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Text(
                  'A message has been sent to this ' +
                      phoneNumber.toString().substring(0, 7) +
                      "*****" +
                      phoneNumber.toString().substring(
                          phoneNumber.toString().length - 3,
                          phoneNumber.toString().length),
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: Colors.purpleAccent),
                )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 250,
                  child: PinFieldAutoFill(
                    decoration: BoxLooseDecoration(
                        strokeColorBuilder: FixedColorBuilder(Colors.purple)),
                    currentCode: _code,
                    onCodeSubmitted: (code) {},
                    onCodeChanged: (code) {
                      if (code!.length == 6) {
                        setState(() {
                          btndisable = false;
                          _code = code;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                showprogressindicatior
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ButtonStyle(
                            elevation: btndisable
                                ? MaterialStateProperty.all(0)
                                : MaterialStateProperty.all(3),
                            backgroundColor: btndisable
                                ? MaterialStateProperty.all(Colors.grey)
                                : MaterialStateProperty.all(Colors.blue)),
                        onPressed: btndisable
                            ? null
                            : () {
                                manualVerification(context);
                              },
                        child: Text('Verify')),
                SizedBox(height: 50),
                showprogressindicatior
                    ? Container()
                    : ElevatedButton(
                        style: ButtonStyle(
                            elevation: isResend
                                ? MaterialStateProperty.all(0)
                                : MaterialStateProperty.all(3),
                            backgroundColor: isResend
                                ? MaterialStateProperty.all(Colors.grey)
                                : MaterialStateProperty.all(Colors.blue)),
                        onPressed: isResend
                            ? null
                            : () {
                                resendToken(phoneNumber, context);
                              },
                        child: Text('Resend Code'))
              ],
            ),
          )),
        )));
  }

  resendToken(phonnumber, BuildContext context) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            isResend = false;
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
            isResend = true;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> codeVerification(phoneNumber) async {
    await SmsAutoFill().listenForCode();

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
// Sign the user in (or link) with the auto-generated credential

        setState(() {
          _code = credential.smsCode.toString();
          btndisable = false;
          isResend = true;
        });
        await auth.signInWithCredential(credential);

        Timer(Duration(seconds: 1), () {
          setState(() {
            showprogressindicatior = true;
          });

          Timer(Duration(seconds: 5), () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeofPhoneVerificationUser()));
          });
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          isResend = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> manualVerification(BuildContext context) async {
// Create a PhoneAuthCredential with the code

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: _code);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);

      Timer(Duration(seconds: 1), () {
        setState(() {
          showprogressindicatior = true;
          isResend = true;
        });

        Timer(Duration(seconds: 5), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeofPhoneVerificationUser()));
        });
      });

// ignore: empty_catches
    } catch (e) {
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      setState(() {
        isResend = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
