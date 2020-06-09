import 'package:flutter/material.dart' show ChangeNotifier;

class BaseModel with ChangeNotifier {
  bool isLoading = true;
  // used while fetching the count
  bool isCountLoading = true;
  // used for pagination calculation
  int pageNumber;
  // used while fetching next page
  bool isNextPageLoading = true;
  // used for storing the response body
  var data;
  // used for displaying the exceptions during API calls
  String errorMessage;
  // for search screen loader
  // bool isPostLoading = true;
  // bool isUserLoading = true;
  // bool hasError = false;
  // bool netwotkIssue = false;

}
