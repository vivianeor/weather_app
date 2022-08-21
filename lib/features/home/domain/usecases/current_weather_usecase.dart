import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:dartz/dartz.dart';

abstract class ICurrentWeatherUseCase {
  Future<Either<Error, CurrentWeatherResult>> getCurrentWeather ({
   required double? lat,
   required double? lon,
});
}