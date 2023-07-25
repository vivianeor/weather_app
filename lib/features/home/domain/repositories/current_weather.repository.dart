import 'package:dartz/dartz.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';

abstract class ICurrentWeatherRepository {
  Future<Either<Error, CurrentWeatherEntity>> getCurrentWeather ({
    required double? lat,
    required double? lon,
  });
}