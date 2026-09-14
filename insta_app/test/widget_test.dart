// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:insta_app/main.dart';

void main() {
  testWidgets('shows the Instagram login form', (WidgetTester tester) async {
    await tester.pumpWidget(const InstaApp());

    expect(find.text('Instagram'), findsOneWidget);
    expect(find.text('Username or email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
  });

  testWidgets('requires credentials before logging in', (WidgetTester tester) async {
    await tester.pumpWidget(const InstaApp());

    await tester.tap(find.text('Log in'));
    await tester.pump();

    expect(find.text('Enter your username or email'), findsOneWidget);
    expect(find.text('Password must be at least 6 characters'), findsOneWidget);
  });
}
