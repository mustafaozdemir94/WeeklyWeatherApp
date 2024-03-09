import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/weather_detail/weather_detail_event.dart';
import 'package:weatherapp/blocs/weather_detail/weather_detail_state.dart';
import 'package:weatherapp/repositories/weather_repository.dart';

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  final WeatherRepository weatherRepository;

  WeatherDetailBloc({required this.weatherRepository}) : super(WeatherDetailInitial()) {
    on<FetchWeatherDetailEvent>(_onFetchWeatherDetail);
    on<ResetFetchWeatherDetailEvent>(_onReset);
  }
  void _onFetchWeatherDetail(FetchWeatherDetailEvent event, Emitter<WeatherDetailState> emit) async {
    emit(WeatherDetailLoading());
    try {
      final weather = await weatherRepository.getWeatherDataByIndex(event.index);
      emit(WeatherDetailLoaded(weather: weather));
    } catch (e) {
      emit(WeatherDetailError());
    }
  }

  void _onReset(ResetFetchWeatherDetailEvent event, Emitter<WeatherDetailState> emit) async {
    emit(WeatherDetailInitial());
  }
}
