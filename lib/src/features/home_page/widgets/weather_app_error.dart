import 'package:flutter/material.dart';

class WeatherAppError extends StatelessWidget {
  const WeatherAppError(this.error, {Key? key}) : super(key: key);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(error),
    );
  }
}
