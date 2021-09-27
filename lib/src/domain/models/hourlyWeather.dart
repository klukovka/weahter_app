import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/models/weather.dart';

class HourlyWeather extends Equatable {
  HourlyWeather({
    required this.clounds,
    required this.dewPoint,
    required this.dt,
    required this.feelsLike,
    required this.humidity,
    required this.precipitationProbability,
    required this.pressure,
    required this.temperature,
    required this.visibility,
    required this.weather,
    required this.windDeg,
    required this.windSpeed,
    this.rain,
    this.snow,
    this.windGust,
  });
  
  final DateTime dt;
  final double temperature;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int clounds;
  final int visibility;
  final double windSpeed;
  final double? windGust;
  final double windDeg;
  final double precipitationProbability;
  final double? rain;
  final double? snow;
  final Weather weather;

  @override
  List<Object?> get props => [
        clounds,
        dewPoint,
        dt,
        feelsLike,
        humidity,
        precipitationProbability,
        pressure,
        rain,
        snow,
        temperature,
        visibility,
        weather,
        windDeg,
        windGust,
        windSpeed,
      ];
}
