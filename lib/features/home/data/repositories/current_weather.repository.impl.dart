import 'package:dartz/dartz.dart';
import 'package:weather_app/features/home/data/datasource/current_weather.datasource.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/domain/repositories/current_weather.repository.dart';

class ICurrentWeatherRepositoryImpl implements ICurrentWeatherRepository {
  final ICurrentWeatherDatasource _datasource;
  ICurrentWeatherRepositoryImpl(this._datasource);

  @override
  Future<Either<Error, CurrentWeatherResult>> getCurrentWeather({required int? lat, required int? lon}) {
    return _datasource.getCurrentWeather(lat: lat, lon: lon);
  }

}