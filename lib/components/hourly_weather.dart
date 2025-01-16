import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather_model.dart';

class HourlyWeather extends StatelessWidget {
  final temp, iconUrl;
  final Hour? time;
  HourlyWeather({super.key, this.temp, this.iconUrl, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Card(
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: Colors.grey.shade400,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        time?.tempC?.round().toString() ?? "",
                        style: TextStyle(
                          //color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "o",
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: Image.network("https:${time?.condition?.icon}")),
                ],
              ),
            ),
          ),
          Text(
            DateFormat.j().format(
              DateTime.parse(time?.time?.toString() ?? ""),
            ),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
