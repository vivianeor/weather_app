import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/features/home/data/datasource/current_weather.datasource.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/home/data/dto/current_weather.dto.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';

class CurrentWeatherDatasourceImplApi implements ICurrentWeatherDatasource {
  @override
  Future<Either<Error, CurrentWeatherEntity>> getCurrentWeather(
      {required double? lat, required double? lon}) async {
    try {
      String _authority = 'https://api.openweathermap.org';
      String _path = '/data/2.5/weather';
      String _params = '?lat=$lat&lon=$lon&appid=05b316695a6e5c9bc50b5b2e1350438e';
      dynamic _result = await http.get(Uri.parse(_authority + _path + _params));
      print(_result.body);

      if (_result.statusCode == 200) {
        return Right(
            CurrentWeatherDto.fromJson(_result.body));
      } else {
        return Left<Error, CurrentWeatherEntity>(Error());
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left<Error, CurrentWeatherEntity>(Error());
    }
  }
}
