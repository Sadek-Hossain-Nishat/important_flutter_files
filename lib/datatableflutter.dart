import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Datatableflutter());
}

class Datatableflutter extends StatelessWidget {
  const Datatableflutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
              appBar: AppBar(title: Text('Data Table'), centerTitle: true),
              body: Center(
                child: DataTable(columns: [
                  DataColumn(label: Text('Name'), tooltip: 'Name'),
                  DataColumn(label: Text('Age'), tooltip: 'Age'),
                  DataColumn(label: Text('Roll'), tooltip: 'Roll')
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('Sadek')),
                    DataCell(Text('25')),
                    DataCell(Text('6211'))
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Sadek')),
                    DataCell(Text('25')),
                    DataCell(Text('6211'))
                  ]),
                  DataRow(cells: [
                    DataCell(Icon(Icons.access_alarm)),
                    DataCell(Text('25')),
                    DataCell(Text('6211'))
                  ])
                ]),
              ))),
    );
  }
}
