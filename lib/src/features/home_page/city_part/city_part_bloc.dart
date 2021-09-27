import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/domain/interactors/get_city_interactor.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_state.dart';

class CityPartBloc extends Bloc<CityPartEvent, CityPartState> {
  CityPartBloc(this._cityInteractor) : super(CityPartLoadingState());

  final GetCityInteractor _cityInteractor;

  @override
  Stream<CityPartState> mapEventToState(CityPartEvent event) async* {
    try {
      yield CityPartLoadingState();
      final city = await _cityInteractor(event.coordinates);
      yield CityPartLoadedState(city);
    } on Exception catch (error) {
      yield CityPartErrorState(error.toString());
    }
  }
}
