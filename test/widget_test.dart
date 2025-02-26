// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/widgets/bla_button.dart';
 // Import the BlaButton widget

void main() {
  testWidgets('BlaButton renders and responds to tap', (WidgetTester tester) async {
    // Create a flag to check if the button was tapped
    bool wasTapped = false;

    // Build the widget inside a MaterialApp
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlaButton(
            text: 'Request to book',
            isPrimary: true,
            onPressed: () {
              wasTapped = true; // Change flag when tapped
            },
          ),
        ),
      ),
    );

    // Verify that the button appears with correct text
    expect(find.text('Request to book'), findsOneWidget);

    // Tap the button
    await tester.tap(find.text('Request to book'));
    await tester.pump();

    // Verify that the onPressed callback was triggered
    expect(wasTapped, isTrue);
  });
}
