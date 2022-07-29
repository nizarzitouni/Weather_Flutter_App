import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSeccess());
    } on Exception {
      emit(WeatherFailure());
    }
  }
}
