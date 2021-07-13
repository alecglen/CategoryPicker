# WidgetPicker

WidgetPicker is a fork of [NumberPicker](https://pub.dev/packages/numberpicker) to support categorical selection via the same UI.

## Example:
(See `example` for more)

```dart
class _WidgetExample extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<_WidgetExample> {
  String _currentValue = "Grape";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WidgetPicker(
          value: _currentValue,
          options: ["Apple", "Banana", "Grape", "Cherry", "Peach"],
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text('Current value: $_currentValue'),
      ],
    );
  }
}
```
