import 'package:weather_app/src/domain/models/city.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/domain/models/feels_like.dart';
import 'package:weather_app/src/domain/models/hourly_weather.dart';
import 'package:weather_app/src/domain/models/temperature.dart';
import 'package:weather_app/src/domain/models/weather.dart';

class JsonParser {
  static City parseJsonToCity(Map<String, dynamic> json) {
    return City(
      country: json['sys']['country'],
      id: json['id'].toString(),
      name: json['name'],
      coordinates: _parseJsonToCoordinates(json['coord']),
    );
  }

  static Coordinates _parseJsonToCoordinates(Map<String, dynamic> json) {
    return Coordinates(json['lat'], json['lon']);
  }

  static DailyWeather parseJsonToDailyWeather(Map<String, dynamic> json) {
    return DailyWeather(
      clouds: json['clouds'],
      dewPoint: json['dew_point'],
      dt: _toDateTime(json['dt']),
      feelsLike: _parseJsonToFeelsLike(json['feels_like']),
      humidity: json['humidity'],
      moonPhase: json['moon_phase'],
      moonrise: _toDateTime(json['moonrise']),
      moonset: _toDateTime(json['moonset']),
      precipitationProbability: json['pop'],
      pressure: json['pressure'],
      sunrise: _toDateTime(json['sunrise']),
      sunset: _toDateTime(json['sunset']),
      temperature: _parseJsonToTemperature(json['temp']),
      weather: _parseJsonToListWeather(json['weather']),
      windDeg: json['wind_deg'],
      windSpeed: json['wind_speed'],
      rain: json['rain'],
      snow: json['snow'],
      windGust: json['wind_gust'],
    );
  }

  static HourlyWeather parseJsonToHourlyWeather(Map<String, dynamic> json) {
    return HourlyWeather(
      clouds: json['clouds'],
      dewPoint: json['dew_point'],
      dt: _toDateTime(json['dt']),
      feelsLike: json['feels_like'],
      humidity: json['humidity'],
      precipitationProbability: json['pop'],
      pressure: json['pressure'],
      temperature: json['temp'],
      visibility: json['visibility'],
      weather: _parseJsonToListWeather(json['weather']),
      windDeg: json['wind_deg'],
      windSpeed: json['wind_speed'],
      rain: _rainSnowWeather(json['rain']),
      snow: _rainSnowWeather(json['snow']),
      windGust: json['wind_gust'],
    );
  }

  static DateTime _toDateTime(timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static FeelsLike _parseJsonToFeelsLike(Map<String, dynamic> json) {
    return FeelsLike(
      day: json['day'],
      evening: json['eve'],
      morning: json['morn'],
      night: json['night'],
    );
  }

  static Temperature _parseJsonToTemperature(Map<String, dynamic> json) {
    return Temperature(
      day: json['day'],
      evening: json['eve'],
      max: json['max'],
      min: json['min'],
      morning: json['morn'],
      night: json['night'],
    );
  }

  static List<Weather> _parseJsonToListWeather(List<dynamic> json) {
    final mappedWeather =
        json.map<Weather>((weather) => _parseJsonToWeather(weather));
    return mappedWeather.toList();
  }

  static Weather _parseJsonToWeather(Map<String, dynamic> json) {
    return Weather(
        description: json['description'],
        icon: json['icon'],
        id: json['id'],
        main: json['main']);
  }

  static num? _rainSnowWeather(Map<String, dynamic>? weather) {
    try {
      return weather!['1h'];
    } catch (error) {
      return null;
    }
  }

  static Coordinates parseJsonToCoordinates(Map<String, dynamic> json) {
    return Coordinates(json['latitude'], json['longitude']);
  }
}
