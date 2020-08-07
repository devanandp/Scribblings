import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribblings/screens/home_screen.dart';
import 'package:scribblings/screens/bottomnavigation/temp_bottom_navigation.dart';
import 'screens/entryscreens/splash.dart';
import 'screens/home_screen.dart';

class Routes {
  Routes() {
    runApp(
       MaterialApp(
              routes: routes,
              debugShowCheckedModeBanner: false,
            ),
    );
  }

  var routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => Splash(),
    '/bottomNavigation' : (BuildContext context) => TempBottomNavigation(),
    '/homeScreen': (BuildContext context) => HomeScreen(),
  };
}
