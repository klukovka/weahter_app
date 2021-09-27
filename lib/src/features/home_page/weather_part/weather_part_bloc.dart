import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/domain/interactors/get_daily_weather_interactor.dart';
import 'package:weather_app/src/domain/interactors/get_hourly_weather_interactor.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_mode.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_event.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_state.dart';

class WeatherPartBloc extends Bloc<WeatherPartEvent, WeatherPartState> {
  WeatherPartBloc(
    this._dailyWeatherInteractor,
    this._hourlyWeatherInteractor,
  ) : super(new WeatherPartState());

  final GetDailyWeatherInteractor _dailyWeatherInteractor;
  final GetHourlyWeatherInteractor _hourlyWeatherInteractor;

  @override
  Stream<WeatherPartState> mapEventToState(WeatherPartEvent event) async* {
    try {
      yield state.copyWith(loading: true);

      if (event is WeatherPartCoordinateEvent) {
        yield* _mapCoordinateEventToState(event);
      } else if (event is WeatherPartModeEvent) {
        yield* _mapModeEventToState(event);
      }
    } catch (error) {
      yield state.copyWith(error: error.toString());
    }
  }

  Stream<WeatherPartState> _mapCoordinateEventToState(
      WeatherPartCoordinateEvent event) async* {
    if (state.weatherMode == WeatherMode.daily) {
      final daily = await _dailyWeatherInteractor(event.coordinates);
      yield state.copyWith(dailyWeather: daily);
    } else if (state.weatherMode == WeatherMode.hourly) {
      final hourly = await _hourlyWeatherInteractor(event.coordinates);
      yield state.copyWith(hourlyWeather: hourly);
    }
  }

  Stream<WeatherPartState> _mapModeEventToState(
      WeatherPartModeEvent event) async* {
    if (event.coordinates == state.coordinates) {
      yield state.copyWith(weatherMode: event.weatherMode);
    } else {
      if (event.weatherMode == WeatherMode.daily) {
        final daily = await _dailyWeatherInteractor(event.coordinates);
        yield state.copyWith(
            dailyWeather: daily, weatherMode: event.weatherMode);
      } else if (event.weatherMode == WeatherMode.hourly) {
        final hourly = await _hourlyWeatherInteractor(event.coordinates);
        yield state.copyWith(
            hourlyWeather: hourly, weatherMode: event.weatherMode);
      }
    }
  }
}
