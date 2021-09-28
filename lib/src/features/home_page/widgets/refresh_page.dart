import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
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
    return LiquidPullToRefresh(
      onRefresh: () async {
        sendEvent<CityPartBloc, CityPartEvent>(context, CityPartEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.weatherApp.tr()),
          actions: [
            ModePopUpMenu(),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: CityPart(),
              flex: 1,
            ),
            Flexible(
              child: WeatherPart(),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
