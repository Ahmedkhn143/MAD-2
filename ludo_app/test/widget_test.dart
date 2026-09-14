import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_app/main.dart';

void main() {
  testWidgets('age palette selector changes the preview and colors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Check initial title and initial age group
    expect(find.text('LUDO WALA'), findsOneWidget);
    expect(find.text('Candy Pop'), findsWidgets);
    expect(find.textContaining('Cherry Pop'), findsWidgets);

    // Tap on the 16 - 45 (Nordic Matte) palette
    await tester.tap(find.textContaining('16 - 45'));
    await tester.pumpAndSettle();

    // Verify Nordic Matte is now active
    expect(find.text('Nordic Matte'), findsWidgets);
    expect(find.textContaining('Terracotta'), findsWidgets);

    // Tap on the 50+ (Heritage Contrast) palette
    await tester.tap(find.textContaining('50+'));
    await tester.pumpAndSettle();

    // Verify Heritage Contrast is now active
    expect(find.text('Heritage Contrast'), findsWidgets);
    expect(find.textContaining('Cardinal Crimson'), findsWidgets);
  });
}
