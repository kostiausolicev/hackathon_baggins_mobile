import 'package:flutter/material.dart';

import 'SignUpAccFirst.dart';
import 'SignUpAccSecond.dart';
import 'LoginAccFirst.dart';
import 'LoginAccSecond.dart';

void main() {
  runApp(BagginsDriveApp());
}

class BagginsDriveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baggins Drive',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SignUpAccFirst(),
    );
  }
}




