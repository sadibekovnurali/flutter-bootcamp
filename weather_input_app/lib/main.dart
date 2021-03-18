import 'package:flutter/material.dart';
import 'package:weather_input_app/data.dart';
import 'package:weather_input_app/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _data = Data();
  final _cityTextController = TextEditingController();

  WeatherFinal _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Input App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Column(
                  children: [
                    Text(
                      _response.cityName,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      '${_response.temperatureInfo.temperature}',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      _response.weatherDescription.description,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _cityTextController,
                  decoration: InputDecoration(hintText: 'Enter city name'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  _search();
                },
                child: Text('Search'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _data.getWeather(_cityTextController.text);
    setState(() {
      _response = response;
    });
  }
}
