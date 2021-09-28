import 'package:weather_app/src/domain/models/coordinates.dart';

abstract class CoordinateRepository {
  Future<Coordinates?> getCoordinates();
}
