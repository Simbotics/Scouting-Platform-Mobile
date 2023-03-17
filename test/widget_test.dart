import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scouting_platform/main.dart';

void main() {
  testWidgets('Performance test', (WidgetTester tester) async {
    // Build the widget that you want to measure the performance of
    const widget = HomeScreen();

    // Pump the widget to the screen
    await tester.pumpWidget(widget);

    // Start recording performance
    final stopwatch = Stopwatch()..start();

    // Perform some action on the widget (e.g. scroll, tap, etc.)
    await tester.scrollUntilVisible(find.byType(ListView), 500);

    // Stop recording performance
    stopwatch.stop();

    // Check that the widget meets your performance criteria
    expect(stopwatch.elapsedMilliseconds, lessThan(100));
  });
}
