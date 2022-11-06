import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(FlutterSharedPreferences());
}

class FlutterSharedPreferences extends StatelessWidget {
  const FlutterSharedPreferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomepageforSharedpreference(),
    );
  }
}

class HomepageforSharedpreference extends StatefulWidget {
  const HomepageforSharedpreference({Key? key}) : super(key: key);

  @override
  State<HomepageforSharedpreference> createState() =>
      _HomepageforSharedpreferenceState();
}

class _HomepageforSharedpreferenceState
    extends State<HomepageforSharedpreference> {
  int count = 0;

  increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      count++;
      prefs.setInt('count', count);
    });
  }

  loadCounterValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      count = prefs.getInt('count') ?? 0;
    });
  }

  @override
  void initState() {
    loadCounterValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shared Preferences'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('You have clicked $count times'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    ));
  }
}
