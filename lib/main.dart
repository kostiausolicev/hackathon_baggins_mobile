import 'package:flutter/material.dart';

import 'register/SignUpAccFirst.dart';
import 'register/SignUpAccSecond.dart';
import 'login/LoginAccFirst.dart';
import 'login/LoginAccSecond.dart';

import 'admin/mainAdmin.dart';

void main() {
  runApp(BagginsDriveApp());
}

class BagginsDriveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baggins Drive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PageViewScreen(),
      //home: AdminBagginsDriveApp(),
    );
  }
}

class PageViewScreen extends StatefulWidget {
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          SignUpAccFirst(pageController: _pageController),
          SignUpAccSecond(pageController: _pageController),
          LoginAccFirst(pageController: _pageController),
          LoginAccSecond(pageController: _pageController),
        ],
      ),
    );
  }
}
