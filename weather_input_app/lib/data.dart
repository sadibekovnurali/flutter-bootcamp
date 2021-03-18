// http://api.openweathermap.org/data/2.5/weather?q=Almaty&appid=b5109683f475629728f9e1121fa88ba0

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_input_app/model.dart';

class Data {
  Future<WeatherFinal> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': 'b5109683f475629728f9e1121fa88ba0',
      'units': 'imperial',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return WeatherFinal.fromJson(json);
  }
}
