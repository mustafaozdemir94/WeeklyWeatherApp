import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherListCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherListCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Container(
              margin: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 6,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF673AB7),
                    Color(0xFFFFAB40),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Text(
                    weather.derece,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Image.network(weather.ikon),
                  const SizedBox(height: 5),
                  Text(
                    "PZRTS",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
