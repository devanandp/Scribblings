import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scribblings/services/config.dart';

class APIHandler {
  static Future<dynamic> get(url) async {
    print("hitting it inside the get request");
    print(config["baseUrl"] + url);
    return http
        .get(
      config["baseUrl"] + url,
    )
        .then((http.Response response) {
      final int statusCode = response.statusCode;
      print("Status code is $statusCode");
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("${response.body.toString()}");
      }
      return utf8.decode(response.bodyBytes);
    });
  }

//  static Future<dynamic> post(url, {body, headers}) async {
//    try {
//      String accessToken;
//      if (headers != false) {
//        print("true hererere");
//        accessToken = await SharedPrefService.prefs.getString("token");
//        print("token =>$accessToken");
//        int expTime = await int.parse(SharedPrefService.prefs.getString("exp"));
//        if (DateTime.fromMicrosecondsSinceEpoch(expTime * 1000000)
//            .difference(DateTime.now())
//            .inMilliseconds <=
//            0) {
//          String password = SharedPrefService.prefs.getString("password");
//          String email = SharedPrefService.prefs.getString("email");
//          String userName = SharedPrefService.prefs.getString("username");
//          await UserController()
//              .userSignIN(email: email, password: password, userName: userName);
//          accessToken = await SharedPrefService.prefs.getString("token");
//        }
//      }
//      if (headers == false) {
//        headers = {'Content-Type': 'application/json'};
//      }
//      print("comming till here");
//      return http
//          .post(config["baseUrl"] + url,
//          headers: headers ??
//              {
//                HttpHeaders.authorizationHeader: "Bearer $accessToken",
//                'Content-Type': 'application/json'
//              },
//          body: body != null ? jsonEncode(body) : {})
//          .then((http.Response response) {
//        final int statusCode = response.statusCode;
//        print(response.statusCode);
//        if (statusCode < 200 || statusCode > 400 || json == null) {
//          throw new Exception("${response.body.toString()}");
//        }
//        return utf8.decode(response.bodyBytes);
//      });
//    } catch (e) {
//      return e;
//    }
//  }
}
