import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetpicker/widgetpicker.dart';

Decoration decoration = BoxDecoration(
  border: Border(
    top: BorderSide(
      style: BorderStyle.solid,
      color: Colors.black26,
    ),
    bottom: BorderSide(
      style: BorderStyle.solid,
      color: Colors.black26,
    ),
  ),
);

Future<WidgetPicker> testWidgetPicker({
  required WidgetTester tester,
  required List<String> options,
  required String initialValue,
  required int scrollBy,
  TextMapper? textMapper,
  required String expectedValue,
  Axis axis = Axis.vertical,
  Decoration? decoration,
}) async {
  String value = initialValue;
  late WidgetPicker picker;

  await tester.pumpWidget(
    StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      picker = axis == Axis.vertical
          ? picker = WidgetPicker(
              value: value,
              options: options,
              textMapper: textMapper,
              decoration: decoration,
              onChanged: (newValue) => setState(() => value = newValue),
            )
          : WidgetPicker(
              axis: Axis.horizontal,
              value: value,
              options: options,
              textMapper: textMapper,
              decoration: decoration,
              onChanged: (newValue) => setState(() => value = newValue),
            );
      return MaterialApp(
        home: Scaffold(
          body: picker,
        ),
      );
    }),
  );
  expect(value, equals(initialValue));

  await scrollWidgetPicker(Offset(0.0, 0.0), tester, scrollBy, axis);
  await tester.pumpAndSettle();

  expect(value, equals(expectedValue));

  return picker;
}

Future<WidgetPicker> testMultipleValuesInPicker({
  required WidgetTester tester,
  required List<String> options,
  required String initialValue,
  required int scrollBy,
  TextMapper? textMapper,
  bool animateToItself = false,
  Axis axis = Axis.vertical,
  required List<String> expectedDisplayValues,
}) async {
  String value = initialValue;
  late WidgetPicker picker;

  await tester.pumpWidget(
    StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      picker = axis == Axis.vertical
          ? picker = WidgetPicker(
              value: value,
              options: options,
              textMapper: textMapper,
              onChanged: (newValue) => setState(() => value = newValue),
            )
          : WidgetPicker(
              value: value,
              options: options,
              textMapper: textMapper,
              onChanged: (newValue) => setState(() => value = newValue),
            );
      return MaterialApp(
        home: Scaffold(
          body: picker,
        ),
      );
    }),
  );
  expect(value, equals(initialValue));

  await scrollWidgetPicker(Offset(0.0, 0.0), tester, scrollBy, axis);
  await tester.pumpAndSettle();

  for (String displayValue in expectedDisplayValues) {
    expect(find.text(displayValue), findsOneWidget);
  }

  return picker;
}

scrollWidgetPicker(
  Offset pickerPosition,
  WidgetTester tester,
  int scrollBy,
  Axis axis,
) async {
  double pickerCenterX, pickerCenterY, offsetX, offsetY;
  double pickerCenterMainAxis = 1.5 * (axis == Axis.vertical ? 50 : 100);
  double pickerCenterCrossAxis = (axis == Axis.vertical ? 100 : 50) / 2;
  if (axis == Axis.vertical) {
    pickerCenterX = pickerCenterCrossAxis;
    pickerCenterY = pickerCenterMainAxis;
    offsetX = 0.0;
    offsetY = -scrollBy * 50;
  } else {
    pickerCenterX = pickerCenterMainAxis;
    pickerCenterY = pickerCenterCrossAxis;
    offsetX = -scrollBy * 100;
    offsetY = 0.0;
  }
  Offset pickerCenter = Offset(
    pickerPosition.dx + pickerCenterX,
    pickerPosition.dy + pickerCenterY,
  );
  final TestGesture testGesture = await tester.startGesture(pickerCenter);
  await testGesture.moveBy(Offset(
    offsetX,
    offsetY,
  ));
}
