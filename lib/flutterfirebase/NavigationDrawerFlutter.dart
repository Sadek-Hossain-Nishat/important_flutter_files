import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(NavigationDrawerFlutter());
}

class NavigationDrawerFlutter extends StatelessWidget {
  const NavigationDrawerFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepagefornavigationdrawer(),
    );
  }
}

class Homepagefornavigationdrawer extends StatefulWidget {
  const Homepagefornavigationdrawer({Key? key}) : super(key: key);

  @override
  State<Homepagefornavigationdrawer> createState() =>
      _HomepagefornavigationdrawerState();
}

class _HomepagefornavigationdrawerState
    extends State<Homepagefornavigationdrawer> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Navigation Drawer'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: Icon(Icons.arrow_forward_ios)),
      ),
      drawer: Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text('Item 1'),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Item 2'),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Item 3'),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Item 2'),
            )
          ],
        ),
      ),
    ));
  }
}
