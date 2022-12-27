import 'dart:convert';

import 'package:weather_app/api/api_key.dart';
import 'package:weather_app/models/weather_current_data.dart';
import 'package:weather_app/models/weather_daily_data.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_hourly_data.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  // processing the data from the response
  Future<WeatherData> getWeather(lat, lon) async {
    var response = await http.get(Uri.parse(getWeatherUri(lat, lon)));
    var jsonString = jsonDecode(response.body);

    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeateherDataDaily.fromJson(jsonString),
    );
    return weatherData!;
  }
}

String getWeatherUri(var lat, var lon) {
  String url;

  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&units=metric&exclude=minutely&appid=$apiKey";
  return url;
}
