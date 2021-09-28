import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/coordinates_repository.dart';

class GetCoordinatesInteractor {
  GetCoordinatesInteractor(this._repository);
  final CoordinateRepository _repository;

  Future<Coordinates> call() async {
    final coordinates =
        (await _repository.getCoordinates()) ?? Coordinates(50.4333, 30.5167);
    return coordinates;
  }
}
