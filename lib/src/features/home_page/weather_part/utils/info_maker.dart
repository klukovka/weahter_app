import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/weather.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/temperature_info.dart';
import 'package:weather_app/src/features/home_page/weather_part/widgets/weather_widget.dart';

class InfoMaker {
  static Widget rowInfo(
    String name,
    dynamic value, {
    String unit = '',
    double horizontalPadding = 15.0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Text('$value $unit'),
          ],
        ),
      );

  static Widget nullCheckPrecipitation(
    String name,
    num? precipitation, [
    String unit = 'mm.',
    double horizontalPadding = 0,
  ]) {
    if (precipitation != null) {
      return rowInfo(
        name,
        precipitation,
        unit: unit,
        horizontalPadding: horizontalPadding,
      );
    }
    return SizedBox();
  }

  static Widget shortInfo(num temperature, num feelsLike, int clouds,
          num precipitationProbability, num? rain, num? snow) =>
      Column(
        children: [
          TemperatureInfo(
            timeOfDay: 'Temperature',
            temperature: temperature,
            feelsLike: feelsLike,
          ),
          rowInfo(
            'Clouds',
            clouds,
            horizontalPadding: 0,
            unit: '%',
          ),
          rowInfo('Precipitation Probability', precipitationProbability,
              horizontalPadding: 0),
          nullCheckPrecipitation('Rain', rain),
          nullCheckPrecipitation('Snow', snow),
        ],
      );

  static List<Widget> weatherList(List<Weather> weather) {
    final _weatherList = <Widget>[Text('Weather')];
    weather.forEach((weather) {
      _weatherList.add(WeatherWidget(weather));
    });
    return _weatherList;
  }
}
