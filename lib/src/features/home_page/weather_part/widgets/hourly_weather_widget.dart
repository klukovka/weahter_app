import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/models/hourlyWeather.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/date_time_mapper.dart';
import 'package:weather_app/src/features/home_page/weather_part/utils/info_maker.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget(
    this.hourlyWeather, {
    Key? key,
  }) : super(key: key);
  final HourlyWeather hourlyWeather;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        DateTineMapper.dateTimeToString(hourlyWeather.dt),
      ),
      subtitle: InfoMaker.shortInfo(
        hourlyWeather.temperature,
        hourlyWeather.feelsLike,
        hourlyWeather.clouds,
        hourlyWeather.precipitationProbability,
        hourlyWeather.rain,
        hourlyWeather.snow,
      ),
      children: _allInfo,
    );
  }

  List<Widget> get _allInfo => [
        ...InfoMaker.weatherList(hourlyWeather.weather),
        Text('Atmosphere'),
        InfoMaker.rowInfo('Pressure', hourlyWeather.pressure, unit: 'hPa'),
        InfoMaker.rowInfo('Humidity', hourlyWeather.humidity, unit: '%'),
        InfoMaker.rowInfo('Atmospheric temperature', hourlyWeather.dewPoint,
            unit: '°C'),
        InfoMaker.rowInfo('Visibility', hourlyWeather.visibility,
            unit: 'metre'),
        Text('Wind'),
        InfoMaker.rowInfo('Wind speed', hourlyWeather.windSpeed,
            unit: 'metre/sec'),
        InfoMaker.rowInfo('Wind direction', hourlyWeather.windDeg,
            unit: 'degrees'),
        InfoMaker.nullCheckPrecipitation(
            'Wind gust', hourlyWeather.windGust, 'metre/sec', 15),
      ];
}
