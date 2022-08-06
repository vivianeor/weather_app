import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';

class CurrentWeatherResultModel extends CurrentWeatherResult {
  const CurrentWeatherResultModel({
    required Coordinates? coordinates,
    required List<WeatherResultModel>? weatherList,
    required String? stations,
    required MainInformation? mainInformation,
    required int? visibility,
    required Wind? wind,
    required Clouds? clouds,
    required int? dt,
    required Sys? sys,
    required int? timezone,
    required int? id,
    required String? name,
    required int? cod,
  }): super(
      coordinates: coordinates,
      weatherList: weatherList,
      stations: stations,
      mainInformation: mainInformation,
      visibility: visibility,
      wind: wind,
      clouds: clouds,
      dt: dt,
      sys: sys,
      timezone: timezone,
      id: id,
      name: name,
      cod: cod
  );

  factory CurrentWeatherResultModel.fromMap(Map<dynamic, dynamic> map) {
    return CurrentWeatherResultModel(
      coordinates: CoordinatesModel.fromMap(map['coordinates']),
      weatherList: List<WeatherResultModel>.from(
          (map['weatherList']).map(
              (dynamic internalMap) => WeatherResultModel.fromMap(internalMap),
          )
      ),
      stations: map['stations'],
      mainInformation: MainInformationResultModel.fromMap(map['mainInformation']),
      visibility: map['visibility'],
      wind: WindResultModel.fromMap(map['wind']),
      clouds: CloudsResultModel.fromMap(map['clouds']),
      dt: map['dt'],
      sys: SysResultModel.fromMap(map['sys']),
      timezone: map['timezone'],
      id: map['id'],
      name: map['name'],
      cod: map['cod'],
    );
  }
}

class CoordinatesModel extends Coordinates {
  final int? lon;
  final int? lat;

  const CoordinatesModel({
    this.lat,
    this.lon,
  });

  factory CoordinatesModel.fromMap(Map<dynamic, dynamic> map) {
    return CoordinatesModel(
      lon: map['lon'],
      lat: map['lat'],
    );
  }
}

class WeatherResultModel extends Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherResultModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherResultModel.fromMap(Map<dynamic, dynamic> map) {
    return WeatherResultModel(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }
}

class MainInformationResultModel extends MainInformation {
  final int? temp;
  final int? feelsLike;
  final int? tempMin;
  final int? temMax;
  final int? pressure;
  final int? humidity;

  const MainInformationResultModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.temMax,
    this.pressure,
    this.humidity,
  });

  factory MainInformationResultModel.fromMap(Map<dynamic, dynamic> map) {
    return MainInformationResultModel(
      temp: map['temp'],
      feelsLike: map['feelsLike'],
      tempMin: map['tempMin'],
      temMax: map['tempMax'],
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }
}

class WindResultModel extends Wind {
  final double? speed;
  final int? deg;

  const WindResultModel({
    this.speed,
    this.deg,
  });

  factory WindResultModel.fromMap(Map<dynamic, dynamic> map) {
    return WindResultModel(
      speed: map['speed'],
      deg: map['deg'],
    );
  }
}

class CloudsResultModel extends Clouds {
  final int? all;

  const CloudsResultModel({
    this.all,
  });

  factory CloudsResultModel.fromMap(Map<dynamic, dynamic> map) {
    return CloudsResultModel(
      all: map['all'],
    );
  }
}

class SysResultModel extends Sys {
  final int? type;
  final int? id;
  final double? message;
  final String? country;
  final String? sunrise;
  final String? sunset;

  const SysResultModel({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysResultModel.fromMap(Map<dynamic, dynamic> map) {
    return SysResultModel(
      type: map['type'],
      id: map['id'],
      message: map['message'],
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }
}
