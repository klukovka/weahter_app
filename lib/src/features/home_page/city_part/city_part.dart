import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/features/base/base_bloc_widget.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_bloc.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_state.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_error.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_loader.dart';

class CityPart
    extends BaseBlocWidget<CityPartBloc, CityPartState, CityPartEvent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      child: observe(builder: (context, state) {
        if (state is CityPartLoadingState) {
          return WeatherAppLoader();
        }
        if (state is CityPartErrorState) {
          return WeatherAppError(state.error);
        }
        if (state is CityPartLoadedState) {
          return ListTile(
            title: Text('City: ${state.city.name}'),
            subtitle: Text(
              'Coordinates: ${_parseCoodrinatesToString(state.city.coordinates)}',
            ),
            trailing: Text(state.city.country),
          );
        }
        return SizedBox();
      }),
    );
  }

  String _parseCoodrinatesToString(Coordinates coordinates) {
    final latitude = coordinates.latitude > 0 ? 'N' : 'S';
    final longitude = coordinates.longitude > 0 ? 'E' : 'W';
    return '${_absNum(coordinates.latitude)} $latitude; ${_absNum(coordinates.longitude)} $longitude';
  }

  num _absNum(num value) {
    return value < 0 ? -value : value;
  }
}
