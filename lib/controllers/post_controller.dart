import 'dart:convert';
import 'package:scribblings/models/feed_card_model.dart';
import 'package:scribblings/services/Api_handler.dart';
import 'base_Model.dart';

class PostController extends BaseModel {
  List<FeedCardModel> feedList = [];

  allPost() async {

  print('-----------HERE-----1221');
    try {
      errorMessage = null;
      notifyListeners();
      print("Hello");
           data = await APIHandler.get(
          'api/posts');
      data = json.decode(data);
      data["data"].forEach((post) {
        Map postJsonData = post;
        FeedCardModel obj = FeedCardModel.fromJson(postJsonData);
        feedList.add(obj);
      });
      print(feedList[0].poem);
      print(feedList[1].poem);

    } catch (e) {
      print("203 exception here => $e");
      if (e.runtimeType.toString() == "SocketException") {
        errorMessage = "Please check your connection";
      } else
        errorMessage = e.toString();
      notifyListeners();
    }
    notifyListeners();
  }


}
