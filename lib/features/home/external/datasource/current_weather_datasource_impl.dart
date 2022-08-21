import 'package:dartz/dartz.dart';
import 'package:weather_app/features/home/data/datasource/current_weather.datasource.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/home/data/models/current_weather_result.model.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';

class CurrentWeatherDatasourceImplApi implements ICurrentWeatherDatasource {
  @override
  Future<Either<Error, CurrentWeatherResult>> getCurrentWeather(
      {required double? lat, required double? lon}) async {
    try {
      var _authority = 'https://api.openweathermap.org';
      var _path = '/data/2.5/weather';
      var _params = {
        'lat': lat,
        'lon': lon,
        'appid': '05b316695a6e5c9bc50b5b2e1350438e'
      };
      var uri = Uri.https(_authority, _path, _params);
      dynamic _result = await http.get(uri);

      if (_result.statusCode == 200){
        final CurrentWeatherResult currentWeatherResult = CurrentWeatherResultModel.fromMap(_result.body);
        return Right<Error, CurrentWeatherResult>(currentWeatherResult);
      } else {
        return Left<Error, CurrentWeatherResult>(Error());
      }
    } catch (e){
      (e) => e.toString();
      return Left<Error, CurrentWeatherResult>(Error());
    }
  }
}