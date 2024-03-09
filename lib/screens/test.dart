import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/models/weather_model.dart';

class Test extends StatelessWidget {
  const Test({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          //
          //
          //
          //
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
              ),
              //
              //
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '📍 Manisa',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    const Text(
                      "Günaydın",
                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              //
              //
              Center(
                child: Image.network(
                  scale: 2,
                  weather.ikon,
                ),
              ),
              //
              //
              Center(
                child: Text(
                  '${double.parse(weather.derece).round()}°C',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Center(
                child: Text(
                  weather.durum.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Center(
                child: Text(
                  DateFormat.yMMMMEEEEd('tr_TR').add_jm().format(DateTime.now()),
                  style: const TextStyle(color: Color(0xFF673AB7), fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
              const Divider(thickness: 2, color: Color(0xFF673AB7)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  //ana row
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/humidity.png",
                          scale: 11,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Nem',
                              style: TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${weather.nem}%',
                              style: const TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/sunrise.png",
                          scale: 11,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Gece',
                              style: TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${double.parse(weather.gece).round()}°C',
                              style: const TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/max_temp.png",
                          scale: 11,
                        ),
                        Column(
                          children: [
                            const Text(
                              'E.Y',
                              style: TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${double.parse(weather.max).round()}°C',
                              style: const TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/min_temp.png",
                          scale: 11,
                        ),
                        Column(
                          children: [
                            const Text(
                              'E.D',
                              style: TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${double.parse(weather.max).round()}°C',
                              style: const TextStyle(color: Color(0xFF673AB7), fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

//                     Text(
//                       "PZRTS",
//                       style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
//                     ),
