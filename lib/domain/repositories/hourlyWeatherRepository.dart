import 'package:weather_app/domain/models/coordinates.dart';
import 'package:weather_app/domain/models/hourlyWeather.dart';

abstract class HourlyWeatherRepository{
  Future<List<HourlyWeather>> getHourlyWeather(Coordinates coordinates);
}