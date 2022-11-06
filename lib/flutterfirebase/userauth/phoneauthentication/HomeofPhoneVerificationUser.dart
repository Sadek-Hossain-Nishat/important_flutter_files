import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeofPhoneVerificationUser extends StatefulWidget {
  const HomeofPhoneVerificationUser({Key? key}) : super(key: key);

  @override
  State<HomeofPhoneVerificationUser> createState() =>
      _HomeofPhoneVerificationUserState();
}

class _HomeofPhoneVerificationUserState
    extends State<HomeofPhoneVerificationUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser!.phoneNumber.toString()),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              signOUtformPhoneVerification();
            },
            child: Text('Sign Out')),
      ),
    ));
  }

  void signOUtformPhoneVerification() {
    FirebaseAuth.instance.signOut();
  }
}
