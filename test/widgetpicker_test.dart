import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  testWidgets('small scroll up works', (WidgetTester tester) async {
    await testWidgetPicker(
        tester: tester,
        options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
        initialValue: 'Banana',
        scrollBy: 2,
        expectedValue: 'Cherry');
  });

  testWidgets('small scroll down works', (WidgetTester tester) async {
    await testWidgetPicker(
        tester: tester,
        options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
        initialValue: 'Cherry',
        scrollBy: -2,
        expectedValue: 'Banana');
  });

  testWidgets('overscroll up to max value',
      (WidgetTester tester) async {
    await testWidgetPicker(
        tester: tester,
        options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
        initialValue: 'Grape',
        scrollBy: 10,
        expectedValue: 'Peach');
  });

  testWidgets('overscroll down to min value',
      (WidgetTester tester) async {
    await testWidgetPicker(
        tester: tester,
        options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
        initialValue: 'Grape',
        scrollBy: -10,
        expectedValue: 'Apple');
  });

  testWidgets('Decorated number picker works', (WidgetTester tester) async {
    await testWidgetPicker(
      tester: tester,
      options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
      initialValue: 'Banana',
      scrollBy: 2,
      expectedValue: 'Cherry',
      decoration: decoration,
    );
  });

  testWidgets('Text mapper works', (WidgetTester tester) async {
    await testMultipleValuesInPicker(
        tester: tester,
        options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
        initialValue: 'Banana',
        scrollBy: 1,
        textMapper: (text) => '$text candy',
        expectedDisplayValues: [
          'Banana candy',
          'Grape candy',
          'Cherry candy'
        ]);
  });
}
