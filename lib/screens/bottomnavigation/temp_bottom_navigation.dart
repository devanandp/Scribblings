import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribblings/screens/about_screen.dart';
import 'package:scribblings/screens/home_screen.dart';

class TempBottomNavigation extends StatefulWidget {
  @override
  _TempBottomNavigationState createState() => _TempBottomNavigationState();
}

class _TempBottomNavigationState extends State<TempBottomNavigation> {
  List<NavigationItem> navItems;

  final List<Widget> _pages = [
    HomeScreen(),
    AboutScreen(),

  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    navItems = [
      NavigationItem(Icon(Icons.home), 'Home'),
      NavigationItem(Icon(Icons.person), 'About'),
    ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var navigationBar = Platform.isIOS
        ? CupertinoTabBar(
            items: navItems.map((e) => e.item()).toList(),
            currentIndex: _selectedIndex,
            activeColor: Colors.teal,
            backgroundColor: Colors.white,
            onTap: _onItemTapped,
          )
        : BottomNavigationBar(
            items: navItems.map((e) => e.item()).toList(),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          );

    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: navigationBar,
            tabBuilder: (BuildContext context, int i) {
              switch (i) {
                case 0:
                  return HomeScreen();
                case 1:
                  return AboutScreen();
                default:
                  return HomeScreen();
              }
            })
        : Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: navigationBar,
          );
  }
}

class NavigationItem {
  NavigationItem(this.icon, this.title);

  Widget icon;
  @required
  String title;

  BottomNavigationBarItem item() {
    return BottomNavigationBarItem(icon: icon, title: Text(title));
  }
}
