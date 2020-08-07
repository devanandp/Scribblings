import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../keys.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color;
  int i = 0;
  int _hearts = 0;
  List colorsList = [Colors.redAccent, Colors.yellow, Colors.green];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Scribblings",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontFamily: "Sacramento",
                fontSize: 25),
          ),
        ),
        body: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "It`s always Success!",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                        fontFamily: "Sacramento",
                        fontSize: 45),
                  ),
                  IconButton(
                    key: Key(Keys.icon_button),
                    icon: Icon(Icons.favorite),
                    iconSize: 55,
                    color: _color,
                    onPressed: () {
                      setState(() {
                        _color = colorsList[i++];
                        _hearts++;
                      });
                      if (i > 2) i = 0;
                    },
                  ),
                  Text(
                    "$_hearts",
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontFamily: "Sacramento",
                        fontSize: 75),
                  ),
                ],
              ),
            )));
  }
}
