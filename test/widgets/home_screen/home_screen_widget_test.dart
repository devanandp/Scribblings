//Type : Widget Test
/* Testing the Home Screen Widgets */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scribblings/keys.dart';
import 'package:scribblings/screens/home_screen.dart';

void main() {
  // Create the widget by telling the tester to build it.
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  group('Testing the Widgets in Home Screen for different scenarios', () {
    //CASE 1 Positive test case - Finds One Title Widget should return pass as the Widget is present
    testWidgets('Testing the Home Screen Title - Positive Scenario',
        (WidgetTester tester) async {
      final String title = 'It`s always Success!';
      await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
      final titleFinder = find.text(title);
      expect(titleFinder, findsOneWidget);
    });

    //CASE 2 Negative test case - Finds No Title Widget should return pass as the Widget is not present
    testWidgets('Testing the Home Screen Title - Negative Scenario',
        (WidgetTester tester) async {
      final String title = 'It`s always Success!';
      await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
      final titleFinder = find.text(title);
      expect(titleFinder, findsNothing);
    });

    //CASE 3 Positive test case - Finds One Button Widget using Key and should return pass as the Widget is present
    testWidgets('Testing the Icon Button Using Key - Positive Scenario',
        (WidgetTester tester) async {
      final buttonKey = Key(Keys.icon_button);
      await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
      final buttonFinder = find.byKey(buttonKey);
      expect(buttonFinder, findsOneWidget);
    });

    //CASE 4 Negative test case - Finds No Widget using Key and should return pass as the Widget is not present
    testWidgets('Testing the Icon Button Using Key - Negative Scenario',
        (WidgetTester tester) async {
      final buttonKey = Key(Keys.icon_button);
      await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
      final buttonFinder = find.byKey(buttonKey);
      expect(buttonFinder, findsNothing);
    });

    //CASE 5 Positive test case - Check Button Actions and find whether hearts are incremented
    testWidgets('Testing the Home Screen Title - Key Scenario',
        (WidgetTester tester) async {
      final buttonKey = Key(Keys.icon_button);
      await tester.pumpWidget(makeTestableWidget(child: HomeScreen()));
      final buttonFinder = find.byKey(buttonKey); //find button using key

      //Finds One text widget with text '0' before any action
      final heartsFinder = find.text("0");
      expect(heartsFinder, findsOneWidget);

      //Tap the button once to perform button action
      await tester.tap(buttonFinder);
      await tester.pump(); //Pump the widget to draw the frames again

      //Finds One text widget with text '1' after tap action
      final heartsFinderAfterTapping = find.text("1");
      expect(heartsFinderAfterTapping, findsOneWidget);

      expect(heartsFinder, findsNothing); //Additional
    });
  });
}
