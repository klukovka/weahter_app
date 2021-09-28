import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/domain/interactors/get_city_interactor.dart';
import 'package:weather_app/src/domain/interactors/get_coordinates_interactor.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_state.dart';

class CityPartBloc extends Bloc<CityPartEvent, CityPartState> {
  CityPartBloc(this._cityInteractor, this._coordinatesInteractor,) : super(CityPartLoadingState());

  final GetCityInteractor _cityInteractor;
  final GetCoordinatesInteractor _coordinatesInteractor;

  @override
  Stream<CityPartState> mapEventToState(CityPartEvent event) async* {
    print(event);
    try {
      yield CityPartLoadingState();
      final coordinates = await _coordinatesInteractor();
      final city = await _cityInteractor(coordinates);
      yield CityPartLoadedState(city, coordinates);
    } catch (error) {
      print(error.toString());
      yield CityPartErrorState(error.toString());
    }
  }
}
