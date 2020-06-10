import 'package:flutter/material.dart';
import 'package:scribblings/models/feed_card_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class DashboardCard extends StatefulWidget {
  final FeedCardModel feedList;

  DashboardCard({this.feedList});

  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  bool isClickedDown = false;
  bool isClickedUp = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          CardHeader(
            feedList: widget.feedList,
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: Text(
                widget.feedList.poem,
                style: TextStyle(fontFamily: 'Sacramento', fontSize: 28),
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
                      widget.feedList.description,
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
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            child: isClickedUp
                                ? Icon(
                                    Icons.thumb_up,
                                    color: Colors.teal,
                                  )
                                : Icon(Icons.thumb_up, color: Colors.black45),
                            onTap: () {
                              setState(() {
                                isClickedDown = false;
                                isClickedUp = !isClickedUp;
                              });
                            },
                          ),
                          Text(
                            widget.feedList.upvoteCount.toString(),
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontFamily: "Sacramento",
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            child: isClickedDown
                                ? Icon(
                                    Icons.thumb_down,
                                    color: Colors.teal,
                                  )
                                : Icon(Icons.thumb_down, color: Colors.black45),
                            onTap: () {
                              setState(() {
                                isClickedDown = !isClickedDown;
                                isClickedUp = false;
                              });
                            },
                          ),
                          Text(
                            widget.feedList.upvoteCount.toString(),
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontFamily: "Sacramento",
                                fontSize: 15),
                          )
                        ],
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
    ));
  }
}

class CardHeader extends StatelessWidget {
  final FeedCardModel feedList;

  const CardHeader({Key key, this.feedList}) : super(key: key);

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
                  "With love ${timeago.format(feedList.createdAt != null ? DateTime.parse(feedList?.createdAt) : DateTime.now())}",
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
