import 'package:flutter/material.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/domain/usecases/current_weather_usecase_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class HomeController {
  final CurrentWeatherUseCaseImpl currentWeatherUseCaseImpl;
  HomeController(this.currentWeatherUseCaseImpl);

  final ValueNotifier<CurrentWeatherEntity?> currentWeatherNotifier = ValueNotifier(null);

  Future<void> getCurrentWeather() async {
    try {
      final local = await _determinePosition();
      final dynamic result = await currentWeatherUseCaseImpl.getCurrentWeather(
          lat: local.latitude, lon: local.longitude);
      await result.fold(
        (error) => throw Exception(error),
        (success) => currentWeatherNotifier.value = success,
      );
   } catch (e) {
      throw Exception("Erro durante a obtenção do clima: $e");
   }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
