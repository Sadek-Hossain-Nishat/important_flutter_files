import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SendingdataintoFirestoreFlutter());
}

class SendingdataintoFirestoreFlutter extends StatelessWidget {
  const SendingdataintoFirestoreFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforsendigdataintofirestore(),
    );
  }
}

class Homepageforsendigdataintofirestore extends StatefulWidget {
  const Homepageforsendigdataintofirestore({Key? key}) : super(key: key);

  @override
  State<Homepageforsendigdataintofirestore> createState() =>
      _HomepageforsendigdataintofirestoreState();
}

class _HomepageforsendigdataintofirestoreState
    extends State<Homepageforsendigdataintofirestore> {
  Future sendData() async {
    final db = FirebaseFirestore.instance.collection("Userinfo").add({
      'name': 'Sadek Hossain Nishat',
      'age': 20,
      'occupation': 'Student',
      'current study level': 'Masters of Science'
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          AppBar(title: Text('Sending data into firebase'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              sendData();
            },
            child: Text('Send Data to Firebase')),
      ),
    ));
  }
}
