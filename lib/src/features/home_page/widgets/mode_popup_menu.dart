import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_mode.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_bloc.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_event.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ModePopUpMenu extends StatelessWidget {
  const ModePopUpMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WeatherMode>(
      itemBuilder: (context) => <PopupMenuEntry<WeatherMode>>[
        PopupMenuItem<WeatherMode>(
          value: WeatherMode.daily,
          child: Text(LocaleKeys.dailyWeather.tr()),
        ),
        PopupMenuItem<WeatherMode>(
          value: WeatherMode.hourly,
          child: Text(LocaleKeys.hourlyWeather.tr()),
        ),
      ],
      onSelected: (mode) {
        BlocProvider.of<WeatherPartBloc>(context).add(
          WeatherPartModeEvent(mode),
        );
      },
    );
  }
}
