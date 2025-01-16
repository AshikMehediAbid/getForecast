import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:intl/intl.dart';

import '../../model/weather_model.dart';

class DayWiseWeather extends StatelessWidget {
  final Forecastday? dayAmongNextSevenDays;
  DayWiseWeather({
    super.key,
    this.dayAmongNextSevenDays,
  });

  WeatherType getWeatherType(String txt) {
    if (txt == 'Sunny' || txt == 'Clear') {
      return WeatherType.sunny;
    }
    if (txt == 'Light snow') {
      return WeatherType.lightSnow;
    }
    if (txt == 'OverCast') {
      return WeatherType.overcast;
    }
    if (txt == 'Partly Cloud' || txt == 'Cloudy') {
      return WeatherType.cloudy;
    }
    if (txt == 'Mist') {
      return WeatherType.lightSnow;
    }
    if (txt.contains('thunder')) {
      return WeatherType.thunder;
    }
    if (txt.contains('rain')) {
      return WeatherType.heavyRainy;
    }
    if (txt.contains('showers')) {
      return WeatherType.middleSnow;
    }

    return WeatherType.thunder;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Stack(children: [
          WeatherBg(
            weatherType: getWeatherType(dayAmongNextSevenDays?.day?.condition?.text),
            width: MediaQuery.of(context).size.width,
            height: 150,
          ),
          SizedBox(
            // height: 100,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            shape: BoxShape.circle,
                          ),
                          child: Image.network("https:${dayAmongNextSevenDays?.day?.condition?.icon}")),
                      Text(dayAmongNextSevenDays?.day?.condition?.text),
                    ],
                  ),
                  Text(
                    DateFormat.MMMEd().format(
                      DateTime.parse(
                        dayAmongNextSevenDays?.date.toString() ?? "",
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        dayAmongNextSevenDays?.day?.maxtempC.round().toString() ?? "",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(" / "),
                      Text(
                        dayAmongNextSevenDays?.day?.mintempC.round().toString() ?? "",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
