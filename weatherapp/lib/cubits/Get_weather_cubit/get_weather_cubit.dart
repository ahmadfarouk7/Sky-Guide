import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/Get_weather_cubit/get_weather_state.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;
  Future<void> getWeather({required String cityName}) async {
    try {
      final weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      if (weatherModel != null) {
        print('Weather Condition: ${weatherModel.weatherCondition}');

        emit(WeatherLoadedState(weatherModel: weatherModel));
      } else {
        emit(WeatherFailureState());
      }
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
