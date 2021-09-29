import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/data_source/open_weather_api.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/city.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/city_repository.dart';

class CityOpenWeatherRepository implements CityRepository {
  final openWeatherApi = OpenWeatherApi();
  @override
  Future<List<City>> getCities(Coordinates coordinates) async {
    final cities = (await openWeatherApi.fetchCities(coordinates))['list'];
    await LocalStorage().saveEntity('lastfetchCity', cities);
    final mappedCities =
        cities.map<City>((city) => JsonParser.parseJsonToCity(city));
    return mappedCities.toList();
  }
}
