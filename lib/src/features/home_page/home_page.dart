import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/repositories/city_open_weather_repository.dart';
import 'package:weather_app/src/data/repositories/daily_open_weather_repository.dart';
import 'package:weather_app/src/data/repositories/hourly_open_weather_repository.dart';
import 'package:weather_app/src/domain/interactors/get_city_interactor.dart';
import 'package:weather_app/src/domain/interactors/get_daily_weather_interactor.dart';
import 'package:weather_app/src/domain/interactors/get_hourly_weather_interactor.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_bloc.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';
import 'package:weather_app/src/features/home_page/weather_part/weather_part_bloc.dart';
import 'package:weather_app/src/features/home_page/widgets/refresh_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Coordinates coordinates = new Coordinates(50.4333, 30.5167);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CityPartBloc>(create: (context) {
          final bloc = CityPartBloc(
            new GetCityInteractor(CityOpenWeatherRepository()),
          );
          getLoc().then((value) => bloc.add(CityPartEvent(coordinates)));
          return bloc;
        }),
        BlocProvider<WeatherPartBloc>(create: (context) {
          final bloc = WeatherPartBloc(
            GetDailyWeatherInteractor(DailyOpenWeatherRepository()),
            GetHourlyWeatherInteractor(HourlyOpenWeatherRepository()),
          );
          return bloc;
        }),
      ],
      child: RefreshPage(
        getLoc: getLoc,
      ),
    );
  }

  Future<Coordinates> getLoc() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return coordinates;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return coordinates;
      }
    }

    final currentLocation = await location.getLocation();

    try {
      coordinates = new Coordinates(
          currentLocation.latitude!, currentLocation.longitude!);
      print(coordinates);
    } on Exception {
      //TODO
    }
    return coordinates;
  }
}
