import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/repositories/city_open_weather_repository.dart';
import 'package:weather_app/src/domain/interactors/get_city_interactor.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_bloc.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Coordinates coordinates = new Coordinates(50.4333, 30.5167);

  @override
  void initState() {
    super.initState();
  }

  void sendEvent<B extends Bloc, E>(BuildContext context, E event) {
    BlocProvider.of<B>(context).add(event);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CityPartBloc>(create: (context) {
          final bloc = CityPartBloc(
            new GetCityInteractor(new CityOpenWeatherRepository()),
          );
          _getLoc().then((value) => bloc.add(new CityPartEvent(coordinates)));
          return bloc;
        }),
      ],
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: CityPart(),
              flex: 1,
            ),
            Flexible(
              child: Container(
                color: Colors.amber,
              ),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getLoc() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final currentLocation = await location.getLocation();
    setState(() {
      try {
        coordinates = new Coordinates(
            currentLocation.latitude!, currentLocation.longitude!);
      } on Exception {
        //TODO
      }
    });
  }
}
