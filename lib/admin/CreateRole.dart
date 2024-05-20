import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CreateRole extends StatelessWidget {
  final PageController AdminPageController;

  CreateRole({required this.AdminPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Создать роль',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Center(
        child: Text('CreateRole'),
      ),
    );
  }
}