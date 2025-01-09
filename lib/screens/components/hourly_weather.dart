import 'package:flutter/material.dart';

class HourlyWeather extends StatelessWidget {
  final temp, iconUrl, time;
  HourlyWeather({super.key, this.temp, this.iconUrl, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      child: Column(
        children: [Text()],
      ),
    );
  }
}
