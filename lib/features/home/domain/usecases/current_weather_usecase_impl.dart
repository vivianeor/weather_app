import 'package:dartz/dartz.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/domain/repositories/current_weather.repository.dart';
import 'package:weather_app/features/home/domain/usecases/current_weather_usecase.dart';

class CurrentWeatherUseCaseImpl implements ICurrentWeatherUseCase {
  final ICurrentWeatherRepository _repository;

  CurrentWeatherUseCaseImpl(this._repository);

  @override
  Future<Either<Error, CurrentWeatherEntity>> getCurrentWeather(
      {required double? lat, required double? lon}) async {
    return await  _repository.getCurrentWeather(lat: lat, lon: lon);
  }
}
