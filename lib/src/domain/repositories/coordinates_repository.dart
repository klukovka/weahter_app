import 'package:weather_app/src/domain/models/coordinates.dart';

abstract class CoordinatesRepository {
  Future<Coordinates?> getCoordinates();
}
