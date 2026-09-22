import 'package:flutter_test/flutter_test.dart';
import 'package:goatkart/main.dart';

void main() {
  testWidgets('GoatKart app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const GoatKartApp());

    // Verify that the GoatKart app starts.
    expect(find.byType(GoatKartApp), findsOneWidget);
  });
}