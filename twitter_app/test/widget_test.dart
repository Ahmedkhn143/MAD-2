// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:twitter_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

     // Verify that the login form is displayed.
     expect(find.text('Sign in to X'), findsOneWidget);
     expect(find.text('Continue with Google'), findsOneWidget);
     expect(find.text('Continue with Apple'), findsOneWidget);
     expect(find.text('Log in'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
     await tester.tap(find.text('Log in'));
    await tester.pump();

     // Verify that the empty form validation messages are displayed.
     expect(find.text('Enter your phone, email, or username'), findsOneWidget);
     expect(find.text('Enter your password'), findsOneWidget);
  });
}
