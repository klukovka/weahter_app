
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/hourly_weather.dart';

abstract class HourlyWeatherRepository{
  Future<List<HourlyWeather>> getHourlyWeather(Coordinates coordinates);
}