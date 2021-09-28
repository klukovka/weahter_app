import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:weather_app/src/domain/interactors/get_city_interactor.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_state.dart';

class CityPartBloc extends Bloc<CityPartEvent, CityPartState> {
  CityPartBloc(this._cityInteractor) : super(CityPartLoadingState());

  final GetCityInteractor _cityInteractor;

  @override
  Stream<CityPartState> mapEventToState(CityPartEvent event) async* {
    print(event);
    try {
      yield CityPartLoadingState();
      final coordinates = (await _getLoc()) ?? Coordinates(50.4333, 30.5167);
      final city = await _cityInteractor(coordinates);
      yield CityPartLoadedState(city, coordinates);
    } catch (error) {
      print(error.toString());
      yield CityPartErrorState(error.toString());
    }
  }

  Future<Coordinates?> _getLoc() async {
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
      return Coordinates(currentLocation.latitude!, currentLocation.longitude!);
    } catch (error) {
      throw error;
    }
  }
}
