import 'dart:async';

import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/HomeofPhoneVerificationUser.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/MobileVerificationScreen.dart';
import 'package:practiceflutter/flutterfirebase/userauth/phoneauthentication/testing/TestingMainPage.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PhoneNumberScreen());
}

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneScreen(),
    );
  }
}

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  // FirebaseAuth auth = FirebaseAuth.instance;
  late String countryCodevalue = '+880';
  var phonnumberfield = TextEditingController();
  var codefield = TextEditingController();
  bool userExist = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool showcircularprogressindicator = false;
  @override
  void initState() {
    // TODO: implement initState
    phonnumberfield.text = "";
    super.initState();

    print('Hello init method');
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          userExist = false;
        });
      } else {
        print('User is signed in!');
        setState(() {
          userExist = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return userExist
        ? HomeofPhoneVerificationUser()
        : SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Mobile Authentication'),
                  centerTitle: true,
                ),
                body: Form(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Auth with Phone',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.deepPurple),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.phone,
                                  color: Colors.purple,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  CountryCodePicker(
                                    onChanged: (countryCode) {
                                      setState(() {
                                        countryCodevalue =
                                            countryCode.dialCode.toString();
                                        print(countryCodevalue);
                                      });
                                    },

                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: 'BD',

                                    // optional. Shows only country name and flag
                                    showCountryOnly: false,
                                    // optional. Shows only country name and flag when popup is closed.
                                    showOnlyCountryWhenClosed: false,
                                    // optional. aligns the flag and the Text left

                                    hideSearch: true,
                                    showDropDownButton: true,
                                  ),
                                  Container(
                                    width: 180,
                                    child: TextFormField(
                                        controller: phonnumberfield,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                            const Radius.circular(10.0),
                                          )),
                                          labelText: 'Phone Number',
                                          hintText: 'Enter your Phone Number',
                                        )),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            showcircularprogressindicator
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () {
                                      if (phonnumberfield.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("Invalid Phone Number"),
                                          duration: Duration(milliseconds: 300),
                                        ));
                                      } else {
                                        String phoneNumber = countryCodevalue +
                                            phonnumberfield.text.toString();
                                        signInviaPhone(phoneNumber);
                                      }
                                    },
                                    child: Text('Sign In'))
                          ],
                        ),
                      )),
                )));
  }

  signInviaPhone(String phoneNumber) async {
    Timer(Duration(seconds: 0), () {
      setState(() {
        showcircularprogressindicator = true;
      });
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MobileVerificationScreen(phoneNumber: phoneNumber)));
      });
    });
  }
}
