import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'd48790c503c141078ee110516242408';

  WeatherService(this.dio);

// لما عملت تراي وكاتش اداني ايرور في الكرانت وحليتها ب علامه الاستفهام عشان النال

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10#');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('An unexpected error occurred');
    }
  }
}
