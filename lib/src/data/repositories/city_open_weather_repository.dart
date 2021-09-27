import 'package:weather_app/src/data/data_source/open_weather_api.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/city.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/city_repository.dart';

class CityOpenWeatherRepository implements CityRepository {
  final openWeatherApi = OpenWeatherApi();
  @override
  Future<List<City>> getCities(Coordinates coordinates) async {
    final cities = await openWeatherApi.fetchCities(coordinates);
    return cities.map((city) =>JsonParser.parseJsonToCity(city));
  }

}
