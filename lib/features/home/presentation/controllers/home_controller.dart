import 'package:flutter/material.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/domain/usecases/current_weather_usecase_impl.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final CurrentWeatherUseCaseImpl currentWeatherUseCaseImpl;
  HomeController(this.currentWeatherUseCaseImpl);

  final ValueNotifier<CurrentWeatherEntity?> currentWeatherNotifier = ValueNotifier(null);

  Future<void> getCurrentWeather() async {
    try {
      //-22.74738502680759, -47.65850246994832
      final dynamic result = await currentWeatherUseCaseImpl.getCurrentWeather(
          lat: -22.74738502680759, lon: -47.65850246994832);
      await result.fold(
        (error) => throw Exception(error),
        (success) => currentWeatherNotifier.value = success,
      );
   } catch (e) {
      throw Exception("Erro durante a obtenção do clima: $e");
   }
  }
}
