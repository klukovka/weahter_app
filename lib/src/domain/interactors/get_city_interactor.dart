import 'dart:math';

import 'package:weather_app/src/domain/interactors/base_interactor.dart';
import 'package:weather_app/src/domain/models/city.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/domain/repositories/city_repository.dart';

class GetCityInteractor implements BaseInteractor<Coordinates, City> {
  GetCityInteractor(this._repository);
  final CityRepository _repository;

  @override
  Future<City> call(Coordinates coordinates) async {
    final cities = await _repository.getCities(coordinates);

    if (cities.length == 1) {
      return cities[0];
    }

    City minDistanceCity = cities[0];
    double minDistance = _calculateDistance(minDistanceCity, coordinates);

    for (int i = 1; i < cities.length; i++) {
      final distance = _calculateDistance(cities[i], coordinates);
      print(distance);
      if (distance < minDistance) {
        minDistance = distance;
        minDistanceCity = cities[i];
      }
    }

    return minDistanceCity;
  }

  double _calculateDistance(City city, Coordinates coordinates) {
    return sqrt(
      pow(city.coordinates.latitude - coordinates.latitude, 2) +
          pow(city.coordinates.longitude - coordinates.longitude, 2),
    );
  }
}
