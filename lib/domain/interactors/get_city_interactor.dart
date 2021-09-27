import 'package:weather_app/domain/interactors/base_interactor.dart';
import 'package:weather_app/domain/models/city.dart';
import 'package:weather_app/domain/models/coordinates.dart';
import 'package:weather_app/domain/repositories/cityRepository.dart';

class GetCityInteractor implements BaseInteractor<Coordinates, City> {
  GetCityInteractor(this._repository);
  final CityRepository _repository;

  @override
  Future<City> call(Coordinates coordinates) {
    return _repository.getCity(coordinates);
  }
}
