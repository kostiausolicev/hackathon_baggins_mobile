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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PageViewScreen(),
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
