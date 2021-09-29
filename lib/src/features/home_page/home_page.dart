import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/repositories/city_local_repository.dart';
import 'package:weather_app/src/data/repositories/city_open_weather_repository.dart';
import 'package:weather_app/src/data/repositories/coordinates_gps_repository.dart';
import 'package:weather_app/src/data/repositories/coordinates_local_repository.dart';
import 'package:weather_app/src/data/repositories/daily_open_weather_repository.dart';
import 'package:weather_app/src/data/repositories/daily_weather_local_repository.dart';
import 'package:weather_app/src/data/repositories/hourly_open_weather_repository.dart';
import 'package:weather_app/src/data/repositories/hourly_weather_local_repository.dart';
import 'package:weather_app/src/domain/interactors/get_city_interactor.dart';
import 'package:weather_app/src/domain/interactors/get_coordinates_interactor.dart';
import 'package:weather_app/src/domain/interactors/get_daily_weather_interactor.dart';
import 'package:weather_app/src/domain/interactors/get_hourly_weather_interactor.dart';
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
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late CityPartBloc cityBloc;
  late WeatherPartBloc weatherBloc;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    cityBloc = CityPartBloc(
        //GetCityInteractor(CityOpenWeatherRepository()),
        //GetCoordinatesInteractor(CoordinatesGPSRepository()),
        GetCityInteractor(CityLocalRepository()),
        GetCoordinatesInteractor(CoordinatesLocalRepository()));
    weatherBloc = WeatherPartBloc(
        // GetDailyWeatherInteractor(DailyOpenWeatherRepository()),
        //  GetHourlyWeatherInteractor(HourlyOpenWeatherRepository()),
        GetDailyWeatherInteractor(DailyWeatherLocalRepository()),
        GetHourlyWeatherInteractor(HourlyWeatherLocalRepository()));
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    cityBloc.close();
    weatherBloc.close();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (_) {
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      cityBloc.close();
      weatherBloc.close();
      if (_connectionStatus == ConnectivityResult.none) {
        cityBloc = CityPartBloc(GetCityInteractor(CityLocalRepository()),
            GetCoordinatesInteractor(CoordinatesLocalRepository()));
        weatherBloc = WeatherPartBloc(
            GetDailyWeatherInteractor(DailyWeatherLocalRepository()),
            GetHourlyWeatherInteractor(HourlyWeatherLocalRepository()));
      } else {
        cityBloc = CityPartBloc(
          GetCityInteractor(CityOpenWeatherRepository()),
          GetCoordinatesInteractor(CoordinatesGPSRepository()),
        );
        weatherBloc = WeatherPartBloc(
          GetDailyWeatherInteractor(DailyOpenWeatherRepository()),
          GetHourlyWeatherInteractor(HourlyOpenWeatherRepository()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CityPartBloc>(
          create: (context) {
            cityBloc.add(CityPartEvent());
            return cityBloc;
          },
          key: ValueKey(_connectionStatus),
        ),
        BlocProvider<WeatherPartBloc>(
          create: (context) {
            return weatherBloc;
          },
          key: ValueKey(_connectionStatus),
        ),
      ],
      child: const RefreshPage(),
    );
  }
}
