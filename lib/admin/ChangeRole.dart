import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ChangeRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Изменить роль',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Center(
        child: Text('ChangeRole'),
      ),
    );
  }
}