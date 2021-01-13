import 'package:flutter_test/flutter_test.dart';

import 'package:playground/main.dart';

void main() {
  group('MyHomePage AppBar test', () {
    testWidgets('MyHomePage Appbar title test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // AppBar 제목 확인
      expect(find.text('PlayGround'), findsOneWidget);
    });
  });
}
