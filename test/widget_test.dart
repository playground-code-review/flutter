// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/all.dart';

import 'package:playground/main.dart';

void main() {
  group('Counter', () {
    testWidgets('Verify that our counter starts at 0.',
        (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MyApp(),
      ));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    testWidgets('Verify that our counter has incremented.',
        (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MyApp(),
      ));

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('2'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('4'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('6'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('8'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('10'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('Verify that our counter has decremented.',
        (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MyApp(),
      ));

      // Tap the '-' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
      expect(find.text('2'), findsNothing);

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });
  });

  group('App', () {
    testWidgets('AppBar 제목 확인', (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(
        child: MyApp(),
      ));
      expect(find.text('PlayGround'), findsOneWidget);
    });
  });
}
