import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/blocs/weather_detail/weather_detail_bloc.dart';
import 'package:weatherapp/blocs/weather_detail/weather_detail_event.dart';
import 'package:weatherapp/blocs/weather_detail/weather_detail_state.dart';

class WeatherDetail extends StatefulWidget {
  final int index;
  const WeatherDetail({super.key, required this.index});

  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherDetailBloc>().add(ResetFetchWeatherDetailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF673AB7),
        body: BlocBuilder<WeatherDetailBloc, WeatherDetailState>(builder: (context, state) {
          if (state is WeatherDetailInitial) {
            context.read<WeatherDetailBloc>().add(FetchWeatherDetailEvent(index: widget.index));
            return const Center(
              child: Text("İstek Atılıyor..."),
            );
          }
          if (state is WeatherDetailLoading) {
            return const Center(
              child: SpinKitRotatingPlain(
                size: 150,
                color: Colors.white,
              ),
            );
          }
          if (state is WeatherDetailLoaded) {
            return Container(
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    state.weather.gun,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  Image.network(
                    state.weather.ikon,
                    scale: 2,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    '${double.parse(state.weather.derece).round()}°C',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Center(
                    child: Text(
                      state.weather.durum.toUpperCase(),
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/humidity.png",
                            scale: 6,
                          ),
                          Column(
                            children: [
                              Text(
                                'Nem',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                '${state.weather.nem}%',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/sunrise.png",
                            scale: 6,
                          ),
                          Column(
                            children: [
                              Text(
                                'Gece',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                '${double.parse(state.weather.gece).round()}°C',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      thickness: 5,
                      color: Color(0xFF673AB7),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/max_temp.png",
                            scale: 6,
                          ),
                          Column(
                            children: [
                              Text(
                                'E.Y',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                '${double.parse(state.weather.max).round()}°C',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/min_temp.png",
                            scale: 6,
                          ),
                          Column(
                            children: [
                              Text(
                                'E.D   ',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                '${double.parse(state.weather.min).round()}°C   ',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          }
          return Container();
        }));
  }
}
