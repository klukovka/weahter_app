import 'dart:convert';

import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/coordinates_repository.dart';

class CoordinatesLocalRepository implements CoordinatesRepository {
  final localStorage = LocalStorage();
  @override
  Future<Coordinates?> getCoordinates() async {
    final json = await localStorage.fetchCoordinates();
    final checkedJson = localStorage.stringChecker(json);
    return JsonParser.parseJsonToCoordinates(jsonDecode(checkedJson));
  }
}
