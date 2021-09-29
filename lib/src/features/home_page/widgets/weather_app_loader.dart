import 'package:flutter/material.dart';

class WeatherAppLoader extends StatelessWidget {
  const WeatherAppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
