import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/screens/app_widget/bla_button.dart';

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
            icon: null, // Callback function to handle button click
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
