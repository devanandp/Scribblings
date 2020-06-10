import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scribblings/controllers/post_controller.dart';
import 'package:scribblings/models/feed_card_model.dart';
import 'package:scribblings/widgets/cards/card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostController postController = PostController();
  List<FeedCardModel> feedListLocal;

  @override
  void initState() {
    // TODO: implement initState
    postController.allPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var container = Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: postController.feedList.length,
          itemBuilder: (context, index) {
            return DashboardCard(feedList: postController.feedList[index]);
          }),
    );

     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         title: Text("Scribblings", style: TextStyle(
           fontStyle: FontStyle.italic,
           fontWeight: FontWeight.bold,
           color: Colors.blue,
           fontFamily: "Sacramento",
           fontSize: 25),),),
            body: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => postController,
              )
            ],
            child: container,
          ));
  }
}
