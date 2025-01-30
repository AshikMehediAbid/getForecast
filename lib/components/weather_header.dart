// weather_header.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherHeader extends StatelessWidget {
  final WeatherModel? weatherModel;

  const WeatherHeader({
    super.key,
    this.weatherModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherModel?.location?.name ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const Text(
                  " , ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  weatherModel?.location?.country ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Text(
              DateFormat.yMMMMEEEEd().format(
                DateTime.parse(weatherModel?.current?.lastUpdated ?? DateTime.now().toString()),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "Last Updated: ${(DateFormat.Hm().format(
                DateTime.parse(weatherModel?.current?.lastUpdated ?? DateTime.now().toString()),
              ))}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
