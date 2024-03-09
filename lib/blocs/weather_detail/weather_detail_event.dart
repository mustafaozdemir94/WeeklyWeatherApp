import 'package:weatherapp/models/weather_model.dart';

abstract class WeatherDetailEvent {}

class FetchWeatherDetailEvent extends WeatherDetailEvent {
  final int index;

  FetchWeatherDetailEvent({required this.index});
}

class ResetFetchWeatherDetailEvent extends WeatherDetailEvent {}
