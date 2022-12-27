import 'package:weather_app/models/weather_current_data.dart';
import 'package:weather_app/models/weather_daily_data.dart';
import 'package:weather_app/models/weather_hourly_data.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeateherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

// fetch the current weather
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeateherDataDaily getDailyWeather() => daily!;
}
