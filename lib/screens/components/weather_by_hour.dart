import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/components/hourly_weather.dart';

class WeatherByHour extends StatelessWidget {
  final WeatherModel? weatherModel;
  WeatherByHour({
    super.key,
    this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length,
      itemBuilder: (context, index) {
        Hour? hour = weatherModel?.forecast?.forecastday?[0].hour?[index];
        return HourlyWeather(
          time: hour,
        );
      },
    );
  }
}
