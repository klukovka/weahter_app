import 'package:weather_app/domain/models/city.dart';
import 'package:weather_app/domain/models/coordinates.dart';

abstract class CityRepository {
  Future<City> getCity(Coordinates coordinates);
}
