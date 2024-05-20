import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ViewRoles.dart';
import 'CreateRole.dart';
import 'ViewUsers.dart';
import 'ViewFilesAdmin.dart';

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
          ViewFilesAdmin(AdminPageController: _AdminPageController),
          ViewRoles(AdminPageController: _AdminPageController),
          CreateRole(AdminPageController: _AdminPageController),
        ],
      ),
      // Add bottom navigation menu for navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
            _AdminPageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/search_icon.svg',
              color: _currentPageIndex == 0 ? Color(0xFFA82230) : Colors.black,
              width: 24,
              height: 24,
            ),
            label: 'Файлы',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/brush_icon.svg',
              color: _currentPageIndex == 1 ? Color(0xFFA82230) : Colors.black,
              width: 24,
              height: 24,
            ),
            label: 'Роли',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/user_icon.svg',
              color: _currentPageIndex == 2 ? Color(0xFFA82230) : Colors.black,
              width: 24,
              height: 24,
            ),
            label: 'Пользователи',
          ),
        ],
      ),
    );
  }
}
