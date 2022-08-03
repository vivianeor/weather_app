import 'package:equatable/equatable.dart';

class WeatherResult extends Equatable {
  final Coordinates? coordinates;
  final List<Weather>? weatherList;
  final String? stations;
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

  const WeatherResult({
    this.coordinates,
    this.weatherList,
    this.stations,
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
  });

  @override
  List<Object?> get props => <Object?> [
    coordinates,
    weatherList,
    stations,
    mainInformation,
    visibility,
    wind,
    clouds,
    dt,
    sys,
    timezone,
    id,
    name,
    cod
  ];
}

class Coordinates extends Equatable {
  final int? lon;
  final int? lat;

  const Coordinates({
   this.lat,
   this.lon,
  });

  @override
  List<Object?> get props => <Object?>[lat, lon];
}

class Weather extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const Weather({
   this.id,
   this.main,
   this.description,
   this.icon,
  });

  @override
  List<Object?> get props => <Object?>[id, main, description, icon];
}

class MainInformation extends Equatable {
  final int? temp;
  final int? feelsLike;
  final int? tempMin;
  final int? temMax;
  final int? pressure;
  final int? humidity;

  const MainInformation({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.temMax,
    this.pressure,
    this.humidity,
  });

  @override
  List<Object?> get props => <Object?>[temp, feelsLike, tempMin, temMax, pressure, humidity];
}

class Wind extends Equatable {
  final double? speed;
  final int? deg;

  const Wind({
    this.speed,
    this.deg,
  });

  @override
  List<Object?> get props => <Object?>[speed, deg];
}

class Clouds extends Equatable {
  final int? all;

  const Clouds({
    this.all,
  });

  @override
  List<Object?> get props => <Object?>[all];
}

class Sys extends Equatable {
  final int? type;
  final int? id;
  final double? message;
  final String? country;
  final String? sunrise;
  final String? sunset;

  const Sys({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  @override
  List<Object?> get props => <Object?>[type, id, message, country, sunset, sunset];
}
