import 'package:location/location.dart';
import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/coordinates_repository.dart';

class CoordinatesGPSRepository implements CoordinatesRepository {
  final localStorage = LocalStorage();

  @override
  Future<Coordinates?> getCoordinates() async {
    final coordinatesLocal = await localStorage.fetchCoordinates();
    final location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return JsonParser.parseJsonToCoordinates(coordinatesLocal);
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return JsonParser.parseJsonToCoordinates(coordinatesLocal);
      }
    }

    final currentLocation = await location.getLocation();

    try {
      final coordinates = {
        'latitude': currentLocation.latitude!,
        'longitude': currentLocation.longitude!,
      };
      await localStorage.saveEntity('lastfetchCoordinates', coordinates);

      return Coordinates(currentLocation.latitude!, currentLocation.longitude!);
    } catch (error) {
      rethrow;
    }
  }
}
