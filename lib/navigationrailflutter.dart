import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practiceflutter/home.dart';
import 'package:practiceflutter/pregnant.dart';

void main(List<String> args) {
  runApp(NavigaitionRailFutter());
}

class NavigaitionRailFutter extends StatelessWidget {
  const NavigaitionRailFutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeForNavigationRail(),
    );
  }
}

class HomeForNavigationRail extends StatefulWidget {
  const HomeForNavigationRail({Key? key}) : super(key: key);

  @override
  _HomeForNavigationRailState createState() => _HomeForNavigationRailState();
}

class _HomeForNavigationRailState extends State<HomeForNavigationRail> {
  int _selectedIndex = 0;
  final _pages = [HompePage(), PregnantWoman()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Navigation Rail'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          NavigationRail(
            labelType: NavigationRailLabelType.all,
            backgroundColor: Color.fromARGB(255, 3, 72, 129),
            destinations: [
              NavigationRailDestination(
                  icon: Icon(
                    Icons.home,
                    color: Colors.green,
                  ),
                  label: Text('Home'),
                  selectedIcon: Icon(
                    Icons.home,
                    color: Colors.red,
                  )),
              NavigationRailDestination(
                  icon: Icon(
                    Icons.pregnant_woman,
                    color: Colors.green,
                  ),
                  label: Text('Pregnant'),
                  selectedIcon: Icon(
                    Icons.home,
                    color: Colors.red,
                  )),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (val) {
              setState(() {
                _selectedIndex = val;
              });
            },
          ),
          Expanded(
              child: Container(
            child: _pages[_selectedIndex],
          ))
        ],
      ),
    ));
  }
}
