import 'package:dartz/dartz.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';

abstract class ICurrentWeatherDatasource {
  Future<Either<Error, CurrentWeatherResult>> getCurrentWeather ({
    required int? lat,
    required int? lon,
  });
}