import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather/weather_bloc.dart';
import 'package:weatherapp/blocs/weather/weather_event.dart';
import 'package:weatherapp/blocs/weather/weather_state.dart';
import 'package:weatherapp/screens/test.dart';
import 'package:weatherapp/widgets/test2.dart';
import 'package:weatherapp/widgets/weather_card.dart';
import 'package:weatherapp/widgets/weather_list_card.dart';

class Denemeler extends StatefulWidget {
  const Denemeler({super.key});

  @override
  _DenemelerState createState() => _DenemelerState();
}

class _DenemelerState extends State<Denemeler> {
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
              child: CircularProgressIndicator(),
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
                  child: Test(weather: state.weathers.first),
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
                    itemBuilder: (context, index) => Test2(
                      weather: state.weathers[index + 1],
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
