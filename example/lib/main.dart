import 'package:flutter/material.dart';
import 'package:widgetpicker/widgetpicker.dart';

void main() {
  runApp(new ExampleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WidgetPicker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Widgetpicker example'),
        ),
        body: _WidgetExample(),
      ),
    );
  }
}

class _WidgetExample extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<_WidgetExample> {
  String _currentSelection = "Grape";
  String _currentHorizontalSelection = "Grape";
  List<String> _options = ["Apple", "Banana", "Grape", "Cherry", "Peach"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        Text('Default', style: Theme.of(context).textTheme.headline6),
        WidgetPicker(
          value: _currentSelection,
          options: _options,
          haptics: true,
          onChanged: (value) => setState(() => _currentSelection = value),
        ),
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                int index = _options.indexOf(_currentSelection);
                if (index > 0) {
                  _currentSelection = _options[index - 1];
                }
              }),
            ),
            Text('Current selection: $_currentSelection'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                int index = _options.indexOf(_currentSelection);
                if (index < _options.length - 1) {
                  _currentSelection = _options[index + 1];
                }
              }),
            ),
          ],
        ),
        Divider(color: Colors.grey, height: 32),
        SizedBox(height: 16),
        Text('Horizontal', style: Theme.of(context).textTheme.headline6),
        WidgetPicker(
          value: _currentHorizontalSelection,
          options: _options,
          itemHeight: 100,
          axis: Axis.horizontal,
          onChanged: (value) =>
              setState(() => _currentHorizontalSelection = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black26),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() {
                int index = _options.indexOf(_currentSelection);
                if (index > 0) {
                  _currentSelection = _options[index - 1];
                }
              }),
            ),
            Text('Current horizontal selection: $_currentHorizontalSelection'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() {
                int index = _options.indexOf(_currentSelection);
                if (index < _options.length - 1) {
                  _currentSelection = _options[index + 1];
                }
              }),
            ),
          ],
        ),
      ],
    );
  }
}
