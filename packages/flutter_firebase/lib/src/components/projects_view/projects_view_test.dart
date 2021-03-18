import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/components/projects_view/projects_view.dart';
import 'package:flutter_test/flutter_test.dart';

final expandableTestWrapper = (Widget child) => Directionality(
      textDirection: TextDirection.ltr,
      child: Row(children: [child]),
    );

void main() {
  final theme = ThemeData(textTheme: TextTheme(headline5: TextStyle(color: Colors.green)));
  testWidgets('textItem has text', (WidgetTester tester) async {
    await tester.pumpWidget(
      expandableTestWrapper(textItem(theme, 'test', 1)),
    );
    final textFinder = find.text('test');
    expect(textFinder, findsOneWidget);
  });
}
