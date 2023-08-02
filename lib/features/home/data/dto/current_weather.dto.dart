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

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherDto(
      coordinates: json['coord'] != null ? Coordinates.fromJson(json['coord']) : null,
      weatherList: List<Weather>.from(json['weather'].map((item) => Weather.fromJson(item))),
      base: json['base'],
      mainInformation: MainInformation.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}