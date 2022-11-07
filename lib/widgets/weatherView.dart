import 'package:flutter/material.dart';
import 'package:cimilo_sheeg/exetensions.dart';
import 'package:weather/weather.dart';

class WeatherView extends StatelessWidget {
  WeatherView({required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${weather.areaName}, ${weather.country}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: '\nUpdated: ${weather.date!.format}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text:
                        '\n\n${weather.temperature!.celsius!.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '°C',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  TextSpan(
                    text: '\n${weather.weatherDescription}',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ]),
          ),
          IconButton(
            onPressed: (() {}),
            icon: Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
    );
  }
}
