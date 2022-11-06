import 'package:flutter/material.dart';

class PregnantWoman extends StatelessWidget {
  const PregnantWoman({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 24, 197),
      body: Center(
        child: Text(
          'Pregnant Woman',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
      ),
    );
  }
}
