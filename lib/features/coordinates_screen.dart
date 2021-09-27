import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_app/domain/models/coordinates.dart';

class CoordinatesScreen extends StatefulWidget {
  const CoordinatesScreen({Key? key}) : super(key: key);

  @override
  _CoordinatesScreenState createState() => _CoordinatesScreenState();
}

class _CoordinatesScreenState extends State<CoordinatesScreen> {
  late LocationData _currentPosition;
  Location location = new Location();
  Coordinates coordinates = new Coordinates(50, 31.6);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Center(
        child: Text('${coordinates.latitude}:${coordinates.longitude}'),
      ),
    );
  }

  Future<void> getLoc() async {
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
    print(_currentPosition);

    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.latitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;
        coordinates = new Coordinates(
            currentLocation.latitude!, currentLocation.longitude!);
      });
    });
  }
}
