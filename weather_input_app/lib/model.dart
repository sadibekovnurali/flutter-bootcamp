class TemperatureInfo {
  final double temperature;

  TemperatureInfo({this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherDescription {
  final String description;

  WeatherDescription({this.description});

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    return WeatherDescription(description: description);
  }
}

class WeatherFinal {
  final String cityName;
  final TemperatureInfo temperatureInfo;
  final WeatherDescription weatherDescription;

  WeatherFinal({this.cityName, this.temperatureInfo, this.weatherDescription});

  factory WeatherFinal.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final temperatureInfoJson = json['main'];
    final temperatureInfo = TemperatureInfo.fromJson(temperatureInfoJson);

    final weatherDescriptionInfoJson = json['weather'][0];
    final weatherDescription =
        WeatherDescription.fromJson(weatherDescriptionInfoJson);

    return WeatherFinal(
      cityName: cityName,
      temperatureInfo: temperatureInfo,
      weatherDescription: weatherDescription,
    );
  }
}
