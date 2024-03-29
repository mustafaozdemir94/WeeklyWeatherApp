// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weatherapp/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final String city;
  final List<WeatherModel> weathers;

  WeatherLoaded({
    required this.city,
    required this.weathers,
  });
}

class WeatherError extends WeatherState {}
