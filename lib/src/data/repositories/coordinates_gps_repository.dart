import 'package:location/location.dart';
import 'package:weather_app/src/data/data_source/local_storage.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/coordinates_repository.dart';

class CoordinatesGPSRepository implements CoordinatesRepository {
  @override
  Future<Coordinates?> getCoordinates() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    final currentLocation = await location.getLocation();

    try {
      final coordinates = {
        'latitude': currentLocation.latitude!,
        'longitude': currentLocation.longitude!,
      };
      LocalStorage().saveEntity('lastfetchCoordinates', coordinates);
        print('''
    
    
    ${await LocalStorage().fetchCoordinates()}
    
    ''');
      return Coordinates(currentLocation.latitude!, currentLocation.longitude!);
    } catch (error) {
      throw error;
    }
  }
}