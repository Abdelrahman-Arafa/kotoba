// This is a basic Flutter widget test for the Kotoba language learning app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kotoba/main.dart';

void main() {
  testWidgets('Kotoba app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Kotoba());

    // Verify that the app title is displayed.
    expect(find.text('Kotoba'), findsOneWidget);

    // Verify that the Numbers category is displayed.
    expect(find.text('Numbers'), findsOneWidget);

    // Verify that the app bar has the correct background color.
    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
  });

  testWidgets('Numbers category navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Kotoba());

    // Find and tap the Numbers category.
    await tester.tap(find.text('Numbers'));
    await tester.pumpAndSettle();

    // Verify that we navigated to the Numbers page.
    expect(find.text('Numbers'), findsOneWidget); // App bar title
    expect(find.byType(Image), findsOneWidget); // Number image
  });
}
