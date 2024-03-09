import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';

class Test2 extends StatelessWidget {
  final WeatherModel weather;
  const Test2({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width / 6,
          height: MediaQuery.of(context).size.height,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                '${double.parse(weather.derece).round()}°C',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Image.network(
                weather.ikon,
                scale: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nem: ',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color: const Color(0xFF673AB7)),
                  ),
                  Text(
                    '${weather.nem}%',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color: const Color(0xFF673AB7)),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              Text(
                weather.gun.length > 5 ? '${weather.gun.substring(0, 3)}...' : weather.gun,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ],
          )),
    );
  }
}
