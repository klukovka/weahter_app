import 'package:equatable/equatable.dart';
import 'package:weather_app/src/domain/models/feels_like.dart';
import 'package:weather_app/src/domain/models/temperature.dart';
import 'package:weather_app/src/domain/models/weather.dart';

class DailyWeather extends Equatable {
  const DailyWeather({
    required this.clouds,
    required this.dewPoint,
    required this.dt,
    required this.feelsLike,
    required this.humidity,
    required this.moonPhase,
    required this.moonrise,
    required this.moonset,
    required this.precipitationProbability,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.weather,
    required this.windDeg,
    required this.windSpeed,
    this.rain,
    this.snow,
    this.windGust,
  });

  
  final DateTime dt; 
  final DateTime sunrise; 
  final DateTime sunset; 
  final DateTime moonrise; 
  final DateTime moonset; 
  final num moonPhase; 
  final Temperature temperature; 
  final FeelsLike feelsLike; 
  final int pressure; 
  final int humidity; 
  final num dewPoint; 
  final num windSpeed; 
  final num windDeg; 
  final num? windGust; 
  final int clouds; 
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
        moonPhase,
        moonrise,
        moonset,
        precipitationProbability,
        pressure,
        rain,
        snow,
        sunrise,
        sunset,
        temperature,
        weather,
        windDeg,
        windGust,
        windSpeed,
      ];
}
