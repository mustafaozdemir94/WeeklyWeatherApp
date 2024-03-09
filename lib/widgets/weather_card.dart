// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weatherapp/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 4 / 2,
            child: Container(
              color: Colors.grey,
              width: double.infinity,
              child: Image.network(weather.ikon),
            ),
          ),
          ListTile(
            title: Text(weather.durum),
            subtitle: Text(weather.nem),
          )
        ],
      ),
    );
  }
}
