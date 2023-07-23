import 'package:flutter/material.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/domain/usecases/current_weather_usecase_impl.dart';
import 'package:flutter/foundation.dart';

//7min
//https://www.youtube.com/watch?v=C_-ZKL52Xn8&list=PLlBnICoI-g-eG0eVkHu2IaO48TljxPjPq&index=2

class HomeController {
  final CurrentWeatherUseCaseImpl currentWeatherUseCaseImpl;
  HomeController(this.currentWeatherUseCaseImpl);

  final ValueNotifier<CurrentWeatherResult?> currentWeatherNotifier = ValueNotifier(null);

  Future<void> getCurrentWeather() async {
    //try {
      //-22.74738502680759, -47.65850246994832
      final dynamic result = await currentWeatherUseCaseImpl.getCurrentWeather(
          lat: -22.74738502680759, lon: -47.65850246994832);
      result.fold(
        (error) => debugPrint(error.toString()),
        (success) => currentWeatherNotifier.value = success,
      );
  //  } catch (e) {
    //  debugPrint(e.toString());
  //  }
  }
}
