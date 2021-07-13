import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_utils.dart';

void main() {
  testWidgets('small scroll up works', (WidgetTester tester) async {
    await testCategoryPicker(
      tester: tester,
      options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
      initialValue: 'Banana',
      scrollBy: 2,
      expectedValue: 'Cherry',
      axis: Axis.horizontal,
    );
  });

  testWidgets('small scroll down works', (WidgetTester tester) async {
    await testCategoryPicker(
      tester: tester,
      options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
      initialValue: 'Cherry',
      scrollBy: -2,
      expectedValue: 'Banana',
      axis: Axis.horizontal,
    );
  });

  testWidgets('overscroll up to max value',
      (WidgetTester tester) async {
    await testCategoryPicker(
      tester: tester,
      options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
      initialValue: 'Grape',
      scrollBy: 10,
      expectedValue: 'Peach',
      axis: Axis.horizontal,
    );
  });

  testWidgets('overscroll down to min value',
      (WidgetTester tester) async {
    await testCategoryPicker(
      tester: tester,
      options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
      initialValue: 'Grape',
      scrollBy: -10,
      expectedValue: 'Apple',
      axis: Axis.horizontal,
    );
  });
}
