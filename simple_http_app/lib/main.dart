import 'package:flutter/material.dart';
import 'package:simple_http_app/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _data = Data();
  String _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Builder(builder: (_) {
            if (_response != null) {
              return Text(_response);
            } else {
              return ElevatedButton(
                child: Text('Make request'),
                onPressed: _makeRequestToApi,
              );
            }
          }),
        ),
      ),
    );
  }

  void _makeRequestToApi() async {
    final response = await _data.makeRequestToApi();
    setState(() => _response = response);
  }
}
