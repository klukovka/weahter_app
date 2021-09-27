import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/data/repositories/city_open_weather_repository.dart';
import 'package:weather_app/src/domain/interactors/get_city_interactor.dart';
import 'package:weather_app/src/domain/models/coordinates.dart';
import 'package:weather_app/src/features/home_page/city_part/city_part_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LocationData _currentPosition;
  Coordinates coordinates = new Coordinates(50.4333, 30.5167);

  @override
  void initState() {
    super.initState();
    _getLoc();
  }

  void sendEvent<B extends Bloc, E>(BuildContext context, E event) {
    BlocProvider.of<B>(context).add(event);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CityPartBloc>(
          create: (context) => CityPartBloc(
            new GetCityInteractor(new CityOpenWeatherRepository()),
          ),
        ),
      ],
      child: Scaffold(   body: Center(
        child: Text('${coordinates.latitude}:${coordinates.longitude}'),
      ),),
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

    _currentPosition = await location.getLocation();

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentPosition = currentLocation;
        try {
          coordinates = new Coordinates(
              currentLocation.latitude!, currentLocation.longitude!);
        } on Exception {
          //TODO
        }
      });
    });
  }
}
