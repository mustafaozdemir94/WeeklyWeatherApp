import 'package:weatherapp/models/weather_model.dart';

abstract class WeatherDetailState {}

class WeatherDetailInitial extends WeatherDetailState {}

class WeatherDetailLoading extends WeatherDetailState {}

class WeatherDetailLoaded extends WeatherDetailState {
  final WeatherModel weather;

  WeatherDetailLoaded({required this.weather});
}

class WeatherDetailError extends WeatherDetailState {}
