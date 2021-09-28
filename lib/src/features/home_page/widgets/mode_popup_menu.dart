import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_mode.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_bloc.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_event.dart';

class ModePopUpMenu extends StatelessWidget {
  const ModePopUpMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WeatherMode>(
      itemBuilder: (context) => <PopupMenuEntry<WeatherMode>>[
        PopupMenuItem<WeatherMode>(
          value: WeatherMode.daily,
          child: Text('Weather for 7 days'),
        ),
        PopupMenuItem<WeatherMode>(
          value: WeatherMode.hourly,
          child: Text('Weather for 48 hours'),
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
