// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ebay_app/main.dart';

void main() {
  testWidgets('sign in advances to the password step', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('Email or username'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'buyer@example.com');
    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(find.text('Enter your password'), findsOneWidget);
    expect(find.text('buyer@example.com'), findsOneWidget);
  });
}
