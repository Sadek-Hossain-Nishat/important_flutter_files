import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlutterFirebseImageLoad());
}

class FlutterFirebseImageLoad extends StatelessWidget {
  const FlutterFirebseImageLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforimageload(),
    );
  }
}

class Homepageforimageload extends StatefulWidget {
  const Homepageforimageload({Key? key}) : super(key: key);

  @override
  State<Homepageforimageload> createState() => _HomepageforimageloadState();
}

class _HomepageforimageloadState extends State<Homepageforimageload> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Image Load from Firebase'),
              centerTitle: true,
            ),
            body: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Categories')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data!.docs[index];
                        return Card(
                          child: GridTile(
                              child: Image.network(
                            data['img_url'],
                            fit: BoxFit.fill,
                          )),
                        );
                      });
                })));
  }
}
