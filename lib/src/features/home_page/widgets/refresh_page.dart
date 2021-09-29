import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:weather_app/src/features/settings_screen/settings_screen.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_bloc.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part.dart';
import 'package:weather_app/src/features/home_page/widgets/mode_popup_menu.dart';

class RefreshPage extends StatelessWidget {
  const RefreshPage({
    Key? key,
  }) : super(key: key);

  void sendEvent<B extends Bloc, E>(BuildContext context, E event) {
    BlocProvider.of<B>(context).add(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.weatherApp.tr()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SettingsScreen();
                }));
              },
              icon: const Icon(Icons.settings)),
          const ModePopUpMenu(),
        ],
      ),
      body: Column(
        children: [
          const Flexible(
            child: CityPart(),
          ),
          LiquidPullToRefresh(
            onRefresh: () async {
              sendEvent<CityPartBloc, CityPartEvent>(context, CityPartEvent());
            },
            child: const Flexible(
              flex: 4,
              child: WeatherPart(),
            ),
          )
        ],
      ),
    );
  }
}
