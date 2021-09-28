import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/models/city.dart';
import 'package:weather_app/src/domain/repositories/city_repository.dart';

class CityLocalRepository implements CityRepository {
  final localStorage = LocalStorage();
  @override
  Future<List<City>> getCities(Coordinates coordinates) async {
    final cities = await localStorage.fetchCity();
    final mappedCities =
        cities.map<City>((city) => JsonParser.parseJsonToCity(city));
    return mappedCities.toList();
  }
}
