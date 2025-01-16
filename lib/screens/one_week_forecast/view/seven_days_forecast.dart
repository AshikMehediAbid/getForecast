import 'package:flutter/material.dart';
import 'package:weather_app/components/day_wise_weather.dart';
import 'package:weather_app/model/weather_model.dart';

class SevenDaysForecast extends StatelessWidget {
  final WeatherModel? weatherModel;
  SevenDaysForecast({
    super.key,
    this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("${weatherModel?.location?.name} , ${weatherModel?.location?.country}"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: weatherModel?.forecast?.forecastday?.length,
          itemBuilder: (context, index) {
            Forecastday? day = weatherModel?.forecast?.forecastday?[index];
            return DayWiseWeather(
              dayAmongNextSevenDays: day,
            );
          },
        ),
      ),
    );
  }
}
