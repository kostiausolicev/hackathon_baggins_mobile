import 'package:flutter/material.dart';

import 'ViewRoles.dart';
import 'CreateRole.dart';
import 'ViewUsers.dart';

class AdminBagginsDriveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baggins Drive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: AdminPageViewScreen(),
    );
  }
}

class AdminPageViewScreen extends StatefulWidget {
  @override
  _AdminPageViewScreenState createState() => _AdminPageViewScreenState();
}

class _AdminPageViewScreenState extends State<AdminPageViewScreen> {
  PageController _AdminPageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _AdminPageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          CreateRole(AdminPageController: _AdminPageController),
          ViewRoles(AdminPageController: _AdminPageController),
          ViewUsers(AdminPageController: _AdminPageController),
        ],
      ),
    );
  }
}
