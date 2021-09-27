
import 'package:weather_app/src/domain/models/city.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';

abstract class CityRepository {
  Future<List<City>> getCities(Coordinates coordinates);
}
