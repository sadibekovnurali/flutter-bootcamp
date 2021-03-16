import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _fontSize = 40;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Accebility App'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(fontSize: _fontSize),
                ),
              ),
              Slider(
                value: _fontSize,
                onChanged: (newValue) {
                  setState(() {
                    _fontSize = newValue;
                  });
                },
                min: 30,
                max: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
