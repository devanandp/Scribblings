import 'dart:async';

import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed('/bottomNavigation');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Text(
          'Scribblings!',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontFamily: "Sacramento",
              fontSize: 75),
        )),
      ),
    );
  }
}
