import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserHomePageafterGoogleSign extends StatefulWidget {
  const UserHomePageafterGoogleSign({Key? key}) : super(key: key);

  @override
  State<UserHomePageafterGoogleSign> createState() =>
      _UserHomePageafterGoogleSignState();
}

class _UserHomePageafterGoogleSignState
    extends State<UserHomePageafterGoogleSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser!.email.toString()),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              signOUt();
            },
            child: Text('Sign Out')),
      ),
    );
  }

  Future<void> signOUt() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
