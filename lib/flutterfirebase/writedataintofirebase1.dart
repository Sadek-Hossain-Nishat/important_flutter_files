import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlutterWriteDataintoFirebase());
}

class FlutterWriteDataintoFirebase extends StatelessWidget {
  const FlutterWriteDataintoFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomepageforwritingdataFirebase(),
    );
  }
}

class HomepageforwritingdataFirebase extends StatefulWidget {
  const HomepageforwritingdataFirebase({Key? key}) : super(key: key);

  @override
  State<HomepageforwritingdataFirebase> createState() =>
      _HomepageforwritingdataFirebaseState();
}

class _HomepageforwritingdataFirebaseState
    extends State<HomepageforwritingdataFirebase> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
