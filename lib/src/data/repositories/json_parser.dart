import 'package:weather_app/src/domain/models/city.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';
import 'package:weather_app/src/domain/models/feels_like.dart';
import 'package:weather_app/src/domain/models/hourlyWeather.dart';
import 'package:weather_app/src/domain/models/temperature.dart';
import 'package:weather_app/src/domain/models/weather.dart';

class JsonParser {
  static City parseJsonToCity(Map<String, dynamic> json) {
    return new City(
      country: json['sys']['country'],
      id: json['id'],
      name: json['name'],
      coordinates: _parseJsonToCoordinates(json['coord']),
    );
  }

  static Coordinates _parseJsonToCoordinates(Map<String, dynamic> json) {
    return new Coordinates(json['lat'], json['lon']);
  }

  static DailyWeather parseJsonToDailyWeather(Map<String, dynamic> json) {
    return new DailyWeather(
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
      weather: _parseJsonToWeather(json['weather']),
      windDeg: json['wind_deg'],
      windSpeed: json['wind_speed'],
      rain: json['rain'],
      snow: json['snow'],
      windGust: json['wind_gust'],
    );
  }

  static HourlyWeather parseJsonToHourlyWeather(Map<String, dynamic> json) {
    return HourlyWeather(
      clounds: json['clounds'],
      dewPoint: json['dew_point'],
      dt: _toDateTime(json['dt']),
      feelsLike: json['feels_like'],
      humidity: json['humidity'],
      precipitationProbability: json['pop'],
      pressure: json['pressure'],
      temperature: json['temp'],
      visibility: json['visibility'],
      weather: _parseJsonToWeather(json['weather']),
      windDeg: json['wind_deg'],
      windSpeed: json['wind_speed'],
      rain: json['rain'],
      snow: json['snow'],
      windGust: json['wind_gust'],
    );
  }

  static DateTime _toDateTime(dynamic timestamp) {
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

  static Weather _parseJsonToWeather(Map<String, dynamic> json) {
    return Weather(
        description: json['description'],
        icon: json['icon'],
        id: json['id'],
        main: json['main']);
  }
}
