import 'dart:convert';

import 'package:location/location.dart';
import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/data/repositories/json_parser.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/coordinates_repository.dart';

class CoordinatesGPSRepository implements CoordinatesRepository {
  final localStorage = LocalStorage();

  @override
  Future<Coordinates?> getCoordinates() async {
    final json = await localStorage.fetchCoordinates();
    final location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        final fetchedServiceCoordinate = _checkLocalCoordinates(json);

        await localStorage.saveEntity('lastfetchCoordinates', {
          'latitude': fetchedServiceCoordinate.latitude,
          'longitude': fetchedServiceCoordinate.longitude,
        });

        return fetchedServiceCoordinate;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        final fetchedPermissionCoordinate = _checkLocalCoordinates(json);

        await localStorage.saveEntity('lastfetchCoordinates', {
          'latitude': fetchedPermissionCoordinate.latitude,
          'longitude': fetchedPermissionCoordinate.longitude,
        });

        return fetchedPermissionCoordinate;
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
      return const Coordinates(50.4333, 30.5167);
    }
  }

  Coordinates _checkLocalCoordinates(String? json) {
    if (json == null) {
      return const Coordinates(50.4333, 30.5167);
    } else {
      final coordinatesLocal = jsonDecode(json);
      return JsonParser.parseJsonToCoordinates(coordinatesLocal);
    }
  }
}
