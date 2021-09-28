import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CityPartBloc>(create: (context) {
          final bloc = CityPartBloc(
         //   GetCityInteractor(CityOpenWeatherRepository()),
          //  GetCoordinatesInteractor(CoordinatesGPSRepository()),
        GetCityInteractor(CityLocalRepository()),
        GetCoordinatesInteractor(CoordinatesLocalRepository())
          );
          bloc.add(CityPartEvent());
          return bloc;
        }),
        BlocProvider<WeatherPartBloc>(create: (context) {
          final bloc = WeatherPartBloc(
          //  GetDailyWeatherInteractor(DailyOpenWeatherRepository()),
           // GetHourlyWeatherInteractor(HourlyOpenWeatherRepository()),
          GetDailyWeatherInteractor(DailyWeatherLocalRepository()),
          GetHourlyWeatherInteractor(HourlyWeatherLocalRepository())
          );
          return bloc;
        }),
      ],
      child: RefreshPage(),
    );
  }
}
