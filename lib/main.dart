import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weatherapp/blocs/weather/weather_bloc.dart';
import 'package:weatherapp/blocs/weather_detail/weather_detail_bloc.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:weatherapp/screens/home_page.dart';

void main() {
  final weatherRepo = WeatherRepository();
  initializeDateFormatting('tr_TR');
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc(
          weatherRepository: weatherRepo,
        ),
      ),
      BlocProvider<WeatherDetailBloc>(
        create: (context) => WeatherDetailBloc(
          weatherRepository: weatherRepo,
        ),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    ),
  ));
}

















// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(useMaterial3: true),
//       home: const Denemeler(),
//     );
//   }
// }
