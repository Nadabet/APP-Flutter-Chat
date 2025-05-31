// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:app_chat/main.dart';

void main() {
  setUpAll(() async {
    // Initialiser les données de localisation pour les tests
    await initializeDateFormatting('fr_FR', null);
  });

  testWidgets('Chat app loads conversations screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ChatApp());

    // Verify that the app bar shows "Chat"
    expect(find.text('Chat'), findsOneWidget);

    // Verify that there's a floating action button
    expect(find.byType(FloatingActionButton), findsOneWidget);

    // Wait for the conversations to load
    await tester.pump(const Duration(milliseconds: 600));

    // Verify that conversations are displayed
    expect(find.text('Aicha Benali'), findsOneWidget);
    expect(find.text('Youssef El Amrani'), findsOneWidget);
  });

  testWidgets('Can navigate to chat detail screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ChatApp());

    // Wait for the conversations to load
    await tester.pump(const Duration(milliseconds: 600));

    // Tap on the first conversation
    await tester.tap(find.text('Aicha Benali'));
    await tester.pumpAndSettle();

    // Verify that we're now in the chat detail screen
    expect(find.text('Aicha Benali'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
