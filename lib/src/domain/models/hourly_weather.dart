import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/models/weather.dart';

class HourlyWeather extends Equatable {
  const HourlyWeather({
    required this.clouds,
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
  final num temperature;
  final num feelsLike;
  final int pressure;
  final int humidity;
  final num dewPoint;
  final int clouds;
  final int visibility;
  final num windSpeed;
  final num? windGust;
  final num windDeg;
  final num precipitationProbability;
  final num? rain;
  final num? snow;
  final List<Weather> weather;

  @override
  List<Object?> get props => [
        clouds,
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
