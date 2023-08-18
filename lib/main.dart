import 'package:flutter/material.dart';
import 'package:sq/Homescreen.dart';

void main(List<String> args) {
  runApp(sqlapp());
}

class sqlapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('sql'),
        // ),
        body: Homescreen(),
      ),
    );
  }
}
