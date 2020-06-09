import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scribblings/controllers/post_controller.dart';

class DashboardCard extends StatefulWidget {
  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  bool isClickedDown = false;
  bool isClickedUp = false;
  PostController postController = PostController();

  @override
  void initState() {
    postController.allPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: MultiProvider(
            providers: [
          ChangeNotifierProvider(
            create: (context) => postController,
          ),
        ],
            child:
                Consumer<PostController>(builder: (context, postController, _) {
              return Container(
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    CardHeader(),
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Center(
                        child: Text(
//                          postController.feedList[0].data[0].description,
                        "Test",
                          style:
                              TextStyle(fontFamily: 'Sacramento', fontSize: 28),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                "Heelo",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            width: 400,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  child: isClickedUp
                                      ? Icon(
                                          Icons.thumb_up,
                                          color: Colors.red,
                                        )
                                      : Icon(Icons.thumb_up,
                                          color: Colors.black45),
                                  onTap: () {
                                    setState(() {
                                      isClickedDown = false;
                                      isClickedUp = !isClickedUp;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  child: isClickedDown
                                      ? Icon(
                                          Icons.thumb_down,
                                          color: Colors.red,
                                        )
                                      : Icon(Icons.thumb_down,
                                          color: Colors.black45),
                                  onTap: () {
                                    setState(() {
                                      isClickedDown = !isClickedDown;
                                      isClickedUp = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          height: 9,
                          color: Colors.black54,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
              );
            })));
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: (Row(
          children: <Widget>[
            SizedBox(width: 5),
            Icon(
              Icons.arrow_forward,
              color: Colors.teal,
            ),
            SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "With Love on June 3,2020 02:43AM",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.teal),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
