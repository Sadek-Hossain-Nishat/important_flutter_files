import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) {
  runApp(FlutterWebView());
}

class FlutterWebView extends StatelessWidget {
  const FlutterWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforflutterwebview(),
    );
  }
}

class Homepageforflutterwebview extends StatefulWidget {
  const Homepageforflutterwebview({Key? key}) : super(key: key);

  @override
  State<Homepageforflutterwebview> createState() =>
      _HomepageforflutterwebviewState();
}

class _HomepageforflutterwebviewState extends State<Homepageforflutterwebview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Flutter WebView'),
        centerTitle: true,
      ),
    ));
  }
}
