
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/hourlyWeather.dart';

abstract class HourlyWeatherRepository{
  Future<List<HourlyWeather>> getHourlyWeather(Coordinates coordinates);
}