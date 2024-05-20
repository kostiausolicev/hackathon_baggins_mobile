import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ViewRoles extends StatelessWidget {
  final PageController AdminPageController;

  ViewRoles({required this.AdminPageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewRoles'),
      ),
      body: Center(
        child: Text('ViewRoles'),
      ),
    );
  }
}