import 'dart:convert';

import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';

class CurrentWeatherDto extends CurrentWeatherEntity {
  final Coordinates? coordinates;
  final List<Weather>? weatherList;
  final String? base;
  final MainInformation? mainInformation;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  CurrentWeatherDto({
    this.coordinates,
    this.weatherList,
    this.base,
    this.mainInformation,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  }) : super(
          coordinates: coordinates,
          weatherList: weatherList,
          base: base,
          mainInformation: mainInformation,
          visibility: visibility,
          wind: wind,
          clouds: clouds,
          dt: dt,
          sys: sys,
          timezone: timezone,
          id: id,
          name: name,
          cod: cod,
        );

  factory CurrentWeatherDto.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherDto(
      coordinates: map['coord'] != null ? CoordinatesDto.fromMap(map['coord']) : null,
      weatherList: map['weather'] ?? [],
      base: map['base'],
      mainInformation:
          map['main'] != null ? MainInformationDto.fromMap(map['main']) : null,
      visibility: map['visibility'],
      wind: map['main'] != null ? WindDto.fromMap(map['wind']) : null,
      clouds: map['main'] != null ? CloudsDto.fromMap(map['clouds']) : null,
      dt: map['dt'],
      sys: map['main'] != null ? SysDto.fromMap(map['sys']) : null,
      timezone: map['timezone'],
      id: map['id'],
      name: map['name'],
      cod: map['cod'],
    );
  }

  factory CurrentWeatherDto.fromJson(String source) =>
      CurrentWeatherDto.fromMap(jsonDecode(source));
}

class CoordinatesDto extends Coordinates {
  final double? lon;
  final double? lat;

  CoordinatesDto({
    this.lat,
    this.lon,
  });

  factory CoordinatesDto.fromMap(Map<String, dynamic> map) {
    return CoordinatesDto(
      lon: map['lon'],
      lat: map['lat'],
    );
  }

  factory CoordinatesDto.fromJson(String source) =>
      CoordinatesDto.fromMap(jsonDecode(source));
}

class WeatherDto extends Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherDto({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherDto.fromMap(Map<dynamic, dynamic> map) {
    return WeatherDto(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  factory WeatherDto.fromJson(String source) => WeatherDto.fromMap(jsonDecode(source));
}

class MainInformationDto extends MainInformation {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? temMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  MainInformationDto({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.temMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory MainInformationDto.fromMap(Map<dynamic, dynamic> map) {
    return MainInformationDto(
      temp: map['temp'],
      feelsLike: map['feelsLike'],
      tempMin: map['temp_min'],
      temMax: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      seaLevel: map['sea_level'],
      grndLevel: map['grnd_level'],
    );
  }

  factory MainInformationDto.fromJson(String source) =>
      MainInformationDto.fromMap(jsonDecode(source));
}

class WindDto extends Wind {
  final double? speed;
  final int? deg;
  final double? gust;

  WindDto({this.speed, this.deg, this.gust});

  factory WindDto.fromMap(Map<dynamic, dynamic> map) {
    return WindDto(
      speed: map['speed'],
      deg: map['deg'],
      gust: map['gust'],
    );
  }

  factory WindDto.fromJson(String source) => WindDto.fromMap(jsonDecode(source));
}

class CloudsDto extends Clouds {
  final int? all;

  CloudsDto({
    this.all,
  });

  factory CloudsDto.fromMap(Map<dynamic, dynamic> map) {
    return CloudsDto(
      all: map['all'],
    );
  }

  factory CloudsDto.fromJson(String source) => CloudsDto.fromMap(jsonDecode(source));
}

class SysDto extends Sys {
  final String? country;
  final int? sunrise;
  final int? sunset;

  SysDto({
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysDto.fromMap(Map<dynamic, dynamic> map) {
    return SysDto(
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }

  factory SysDto.fromJson(String source) => SysDto.fromMap(jsonDecode(source));
}
