import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/coordinates_repository.dart';

class CoordinatesLocalRepository implements CoordinatesRepository {
  final localStorage = LocalStorage();
  @override
  Future<Coordinates?> getCoordinates() async {
    final coordinates = await localStorage.fetchCoordinates();
    return JsonParser.parseJsonToCoordinates(coordinates);
  }
}
