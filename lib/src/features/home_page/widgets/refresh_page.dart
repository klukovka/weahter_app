import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_bloc.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part.dart';
import 'package:weather_app/src/features/home_page/widgets/mode_popup_menu.dart';

class RefreshPage extends StatelessWidget {
  const RefreshPage({
    required this.getLoc,
    Key? key,
  }) : super(key: key);

  void sendEvent<B extends Bloc, E>(BuildContext context, E event) {
    BlocProvider.of<B>(context).add(event);
  }

  final Future<Coordinates> Function() getLoc;
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () async {
        getLoc.call().then((value) {
          sendEvent<CityPartBloc, CityPartEvent>(context, CityPartEvent(value));
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
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
