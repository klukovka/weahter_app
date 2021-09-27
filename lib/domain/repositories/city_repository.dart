import 'package:weather_app/domain/models/city.dart';
import 'package:weather_app/domain/models/coordinates.dart';

abstract class CityRepository {
  Future<List<City>> getCities(Coordinates coordinates);
}
