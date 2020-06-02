import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poems_app/widgets/cards/card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          DashboardCard(),
          DashboardCard()
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
                child: container,
                navigationBar: CupertinoNavigationBar(middle:
                Text('Scribblings!', style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: "Sacramento",
                    fontSize: 28
                ),)));
          })
        : Scaffold(body: container);
  }
}