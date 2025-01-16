import 'package:flutter/material.dart';
import 'package:weather_app/components/hourly_weather.dart';
import 'package:weather_app/model/weather_model.dart';

class TwentyFourHourForecast extends StatelessWidget {
  final WeatherModel? weatherModel;
  TwentyFourHourForecast({
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
