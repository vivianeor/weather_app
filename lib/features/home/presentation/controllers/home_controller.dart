import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/features/home/data/models/current_weather.model.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/domain/usecases/current_weather_usecase_impl.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final CurrentWeatherUseCaseImpl currentWeatherUseCaseImpl;

  _HomeController(
    this.currentWeatherUseCaseImpl,
);
  late CurrentWeatherResult currentWeatherResult;

  Future<CurrentWeatherResult?> getCurrentWeather() async {
    try {
      //-22.74738502680759, -47.65850246994832
      final dynamic result = await currentWeatherUseCaseImpl.getCurrentWeather(lat: -22.74738502680759, lon: -47.65850246994832);
      result.fold(
        (Error error) => debugPrint(error.toString()),
        (CurrentWeatherResult _currentWeatherResult) {
          currentWeatherResult = _currentWeatherResult;
    });
      return currentWeatherResult;
    } catch (e){
      debugPrint(e.toString());
    }
    return null;
  }
}