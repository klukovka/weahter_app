import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/domain/interactors/get_daily_weather_interactor.dart';
import 'package:weather_app/src/domain/interactors/get_hourly_weather_interactor.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_event.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_state.dart';

class WeatherPartBloc extends Bloc<WeatherPartEvent, WeatherPartState> {
  WeatherPartBloc(
    this._dailyWeatherInteractor,
    this._hourlyWeatherInteractor,
  ) : super(const WeatherPartState());

  final GetDailyWeatherInteractor _dailyWeatherInteractor;
  final GetHourlyWeatherInteractor _hourlyWeatherInteractor;

  @override
  Stream<WeatherPartState> mapEventToState(WeatherPartEvent event) async* {
    yield state.copyWith(loading: true);

    if (event is WeatherPartCoordinateEvent) {
      yield* _mapCoordinateEventToState(event);
    } else if (event is WeatherPartModeEvent) {
      yield* _mapModeEventToState(event);
    }
  }

  Stream<WeatherPartState> _mapCoordinateEventToState(
      WeatherPartCoordinateEvent event) async* {
    try {
      final daily = await _dailyWeatherInteractor(event.coordinates);
      final hourly = await _hourlyWeatherInteractor(event.coordinates);      
      yield state.copyWith(
        hourlyWeather: hourly,
        coordinates: event.coordinates,
        dailyWeather: daily,
      );
    } on Exception catch (error) {
      yield state.copyWith(error: error.toString());
    }
  }

  Stream<WeatherPartState> _mapModeEventToState(
      WeatherPartModeEvent event) async* {
    try {
      yield state.copyWith(weatherMode: event.weatherMode);
    } catch (error) {
      yield state.copyWith(error: error.toString());
    }
  }
}
