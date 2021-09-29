import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/features/base/base_bloc_widget.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_bloc.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_state.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_bloc.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_event.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_error.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_loader.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CityPart
    extends BaseBlocWidget<CityPartBloc, CityPartState, CityPartEvent> {
  const CityPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return addListener(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: observe(builder: (context, state) {
          if (state is CityPartLoadingState) {
            return const WeatherAppLoader();
          }
          if (state is CityPartErrorState) {
            return WeatherAppError(state.error);
          }
          if (state is CityPartLoadedState) {
            final coordinates = _parseCoodrinatesToString(state.coordinates);
            return ListTile(
              title: Text(
                '${LocaleKeys.city.tr()}: ${state.city.name}',
                style: textTheme.headline2,
              ),
              subtitle: Text(
                '${LocaleKeys.coordinates.tr()}:\n$coordinates',
                style: textTheme.headline3,
              ),
              trailing: Text(state.city.country, style: textTheme.headline3),
              isThreeLine: true,
            );
          }

          return const SizedBox();
        }),
      ),
      listener: (context, state) {
        if (state is CityPartLoadedState) {
          BlocProvider.of<WeatherPartBloc>(context).add(
            WeatherPartCoordinateEvent(state.coordinates),
          );
        }
      },
    );
  }

  String _parseCoodrinatesToString(Coordinates coordinates) {
    final latitude =
        coordinates.latitude > 0 ? LocaleKeys.n.tr() : LocaleKeys.s.tr();
    final longitude =
        coordinates.longitude > 0 ? LocaleKeys.e.tr() : LocaleKeys.w.tr();
    final absLatitude = _absNum(coordinates.latitude);
    final absLongitude = _absNum(coordinates.longitude);
    return '$absLatitude $latitude; $absLongitude $longitude';
  }

  num _absNum(num value) {
    return value < 0 ? -value : value;
  }
}
