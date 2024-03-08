import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';

import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/screens/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherModel> _weathers = [];
  String city = '';
  String time = "";

  void _setTime() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;
    setState(() {
      if (hour >= 5 && hour < 12) {
        time = 'Günaydın';
      } else if (hour >= 12 && hour < 17) {
        time = 'İyi günler';
      } else if (hour >= 17 && hour < 23) {
        time = 'İyi akşamlar';
      } else {
        time = 'İyi geceler';
      }
    });
  }

  void _getWeatherData() async {
    final String city = await WeatherService().getLocation();
    _weathers = await WeatherService().getWeatherData();

    setState(() {
      this.city = city;
    });
  }

  Future<void> _refresh() async {
    _getWeatherData();
  }

  @override
  void initState() {
    _getWeatherData();
    _setTime();
    initializeDateFormatting('tr_TR', "");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: _weathers.map((weather) {
                return Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(3, -0.3),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-3, -0.3),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF673AB7)),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, -1.2),
                      child: Container(
                        height: 300,
                        width: 600,
                        decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📍 $city',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            " $time",
                            style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.network(weather.ikon),
                          ),
                          Center(
                            child: Text(
                              '${double.parse(weather.derece).round()}°C',
                              style: const TextStyle(color: Colors.white, fontSize: 55, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Center(
                            child: Text(
                              weather.durum.toUpperCase(),
                              style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: Text(
                              DateFormat.yMMMMEEEEd('tr_TR').add_jm().format(DateTime.now()),
                              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/humidity.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Nem',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        '${weather.nem}%',
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/sunrise.png",
                                        scale: 8,
                                      ),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Gece Sıcaklık',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            '${double.parse(weather.gece).round()}°C',
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/max_temp.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'En Yüksek',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        '${double.parse(weather.max).round()}°C',
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/min_temp.png",
                                        scale: 8,
                                      ),
                                      const SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'En Düşük       ',
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            '${double.parse(weather.min).round()}°C',
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
