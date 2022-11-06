import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userpage extends StatelessWidget {
  const Userpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforuser(),
    );
  }
}

class Homepageforuser extends StatefulWidget {
  const Homepageforuser({Key? key}) : super(key: key);

  @override
  State<Homepageforuser> createState() => _HomepageforuserState();
}

class _HomepageforuserState extends State<Homepageforuser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(FirebaseAuth.instance.currentUser!.email.toString()),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              signOut();
            },
            child: Text('Sign Out')),
      ),
    ));
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();

    // Navigator.pop(
    //     context, MaterialPageRoute(builder: (context) => Firebaselogin()));
  }
}
