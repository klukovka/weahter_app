import 'package:flutter/material.dart';
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
      child: observe(builder: (context, state) {
        if (state is CityPartLoadingState) {
          return WeatherAppLoader();
        }
        if (state is CityPartErrorState) {
          return WeatherAppError(state.error);
        }
        if (state is CityPartLoadedState) {
          return Text(state.city.name);
        }
        return SizedBox();
      }),
    );
  }
}
