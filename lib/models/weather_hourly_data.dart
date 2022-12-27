class WeatherDataHourly {
  final List<HourlyData> hourlyData;

  WeatherDataHourly({required this.hourlyData});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
        hourlyData: List<HourlyData>.from(
            json['hourly'].map((e) => HourlyData.fromJson(e))),
      );
}

class HourlyData {
  int? dt;
  int? temp;
  List<Weather>? weather;

  HourlyData({
    this.dt,
    this.temp,
    this.weather,
  });

  factory HourlyData.fromJson(Map<String, dynamic> json) => HourlyData(
        dt: json['dt'] as int?,
        temp: (json['temp'] as num?)?.round(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp,
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
