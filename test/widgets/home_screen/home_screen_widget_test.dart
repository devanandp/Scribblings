//Type : Widget Test
/* Testing the Model Pop up which comes on Login in the Welcome Screen
using Key Values */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scribblings/keys.dart';
import 'package:scribblings/screens/home_screen.dart';

void main() {
  // Create the widget by telling the tester to build it.
  Widget makeTestableWidget({Widget child, Key key}) {
    return MaterialApp(
      home: child,
    );
  }

  group('Testing the Message in Home Screen for different scenarios',
      () {

    //CASE 1 Positive test case - Finds One Widget should return pass as the Widget is present
    testWidgets('Testing the Welcome screen Model - Positive Scenario',
        (WidgetTester tester) async {
      final testKey = ValueKey(Keys.icon_button);
      final String title= 'It`s always Success!';
      await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
      final titleFinder = find.text(title);
      expect(titleFinder, findsOneWidget);
    });

  });
}
