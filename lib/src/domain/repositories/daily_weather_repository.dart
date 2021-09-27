
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/daily_weather.dart';

abstract class DailyWeatherRepository{
  Future<List<DailyWeather>> getDailyWeather(Coordinates coordinates);
}