import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/domain/usecases/current_weather_usecase_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class HomeController {
  final CurrentWeatherUseCaseImpl currentWeatherUseCaseImpl;
  HomeController(this.currentWeatherUseCaseImpl);

  String? description;

  final ValueNotifier<CurrentWeatherEntity?> currentWeatherNotifier =
      ValueNotifier(null);
  Future<void> getCurrentWeather() async {
    try {
      final local = await _determinePosition();

      final dynamic result = await currentWeatherUseCaseImpl.getCurrentWeather(
          lat: local.latitude, lon: local.longitude);
      await result.fold(
        (error) => throw Exception(error),
        (success) => currentWeatherNotifier.value = success,
      );
      await translateText(currentWeatherNotifier.value);
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

  Future<String?> translateText(CurrentWeatherEntity? text) async {
    final translator = GoogleTranslator();

    try {
      final traducao = await translator.translate(
          text?.weatherList?[0].description ?? '',
          from: 'en',
          to: 'pt');
      return description = traducao.text;
    } catch (e) {
      print('Erro na tradução: $e');
      return null;
    }
  }
}
