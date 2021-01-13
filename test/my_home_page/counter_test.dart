import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:playground/main.dart';

void main() {
  group('MyHomePage Counter test', () {
    testWidgets('Counter increment button test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      int currentValue = 0;
      while (currentValue < 10) {
        // Tap the '+' icon and trigger a frame.
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        // Counter가 2씩 증가하는지 테스트
        currentValue = (currentValue + 2).clamp(0, 10);
        expect(find.text('$currentValue'), findsOneWidget);
      }

      // Counter가 10에서 더 올라가지 않는지 테스트
      expect(find.text('10'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('10'), findsOneWidget);

      while (currentValue > 0) {
        // Tap the '-' icon and trigger a frame.
        await tester.tap(find.byIcon(Icons.remove));
        await tester.pump();

        // Counter가 2씩 감소하는지 테스트
        currentValue = (currentValue - 2).clamp(0, 10);
        expect(find.text('$currentValue'), findsOneWidget);
      }

      // Counter가 0에서 더 내려가지 않는지 테스트
      expect(find.text('0'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
    });
  });
}
