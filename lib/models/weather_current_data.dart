// instance of the current data class.
class WeatherDataCurrent {
  final CurrentData currentData;
  WeatherDataCurrent({required this.currentData});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(currentData: CurrentData.fromJson(json['current']));
}

class CurrentData {
  int? temp;
  double? feelsLike;
  int? humidity;
  double? uvi;
  int? clouds;
  double? windSpeed;
  List<Weather>? weather;

  CurrentData({
    this.temp,
    this.feelsLike,
    this.humidity,
    this.uvi,
    this.clouds,
    this.windSpeed,
    this.weather,
  });

  factory CurrentData.fromJson(Map<String, dynamic> json) => CurrentData(
        temp: (json['temp'] as num?)?.round(),
        feelsLike: (json['feels_like'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
        clouds: json['clouds'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'feels_like': feelsLike,
        'humidity': humidity,
        'uvi': uvi,
        'clouds': clouds,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
