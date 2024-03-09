import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/blocs/weather/weather_bloc.dart';
import 'package:weatherapp/blocs/weather/weather_event.dart';
import 'package:weatherapp/blocs/weather/weather_state.dart';
import 'package:weatherapp/blocs/weather_detail/weather_detail_bloc.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:weatherapp/widgets/first_weather_widget.dart';
import 'package:weatherapp/widgets/weekly_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String time = "";
  void setTime() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;
    setState(() {
      if (hour >= 5 && hour < 12) {
        time = 'Günaydın';
      } else if (hour >= 12 && hour < 17) {
        time = 'İyi Günler';
      } else if (hour >= 17 && hour < 23) {
        time = 'İyi Akşamlar';
      } else {
        time = 'İyi Geceler';
      }
    });
  }

  @override
  void initState() {
    context.read<WeatherBloc>().add(ResetFetchWeatherEvent());
    setTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF673AB7),
        body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherInitial) {
            context.read<WeatherBloc>().add(FetchWeather());

            return const Center(
              child: Text("İstek Atılıyor"),
            );
          }
          if (state is WeatherLoading) {
            return const Center(
              child: SpinKitRotatingPlain(
                size: 150,
                color: Colors.white,
              ),
            );
          }
          if (state is WeatherError) {
            return const Center(
              child: Text("İstek Hatalı!"),
            );
          }
          if (state is WeatherLoaded) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: FirstWeatherWidget(
                    weather: state.weathers.first,
                    city: state.city,
                    time: time,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Divider(
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "Haftalık Hava Durumu",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Divider(
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.weathers.length > 1 ? state.weathers.length - 1 : 0,
                    itemBuilder: (context, index) => WeeklyWeatherWidget(
                      weather: state.weathers[index + 1],
                      index: index + 1,
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(
            child: Text("Bilinmedik Durum"),
          );
        }));
  }
}
