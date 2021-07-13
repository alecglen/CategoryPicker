# CategoryPicker

CategoryPicker is a fork of [NumberPicker](https://pub.dev/packages/numberpicker) to support categorical selection via the same UI.

## Example:
(See `example` for more)

```dart
class _CategoryExample extends StatefulWidget {
  @override
  __CategoryExampleState createState() => __CategoryExampleState();
}

class __CategoryExampleState extends State<_CategoryExample> {
  String _currentValue = "Grape";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CategoryPicker(
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
