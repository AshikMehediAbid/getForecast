import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/weather_model.dart';

class DayWiseWeather extends StatelessWidget {
  final Forecastday? dayAmongNextSevenDays;
  DayWiseWeather({
    super.key,
    this.dayAmongNextSevenDays,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
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
    );
  }
}
