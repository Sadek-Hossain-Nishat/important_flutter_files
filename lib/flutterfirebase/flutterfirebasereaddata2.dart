import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ReadDataFirebaseFlutter());
}

class ReadDataFirebaseFlutter extends StatelessWidget {
  const ReadDataFirebaseFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomepageforReadDataFlutterFirebase(),
    );
  }
}

class HomepageforReadDataFlutterFirebase extends StatefulWidget {
  const HomepageforReadDataFlutterFirebase({Key? key}) : super(key: key);

  @override
  State<HomepageforReadDataFlutterFirebase> createState() =>
      _HomepageforReadDataFlutterFirebaseState();
}

class _HomepageforReadDataFlutterFirebaseState
    extends State<HomepageforReadDataFlutterFirebase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Read Data From Firebase'),
            ),
            body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Countries')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((e) {
                      return Container(
                        child: Center(
                          child: Text(e['name']),
                        ),
                      );
                    }).toList(),
                  );
                })));
  }
}
