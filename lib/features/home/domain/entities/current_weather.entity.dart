class CurrentWeatherEntity{
  Coordinates? coordinates;
  List<Weather>? weatherList;
  String? base;
  MainInformation? mainInformation;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherEntity({
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
  });
}

class Coordinates  {
  double? lon;
  double? lat;

  Coordinates({
   this.lat,
   this.lon,
  });
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
   this.id,
   this.main,
   this.description,
   this.icon,
  });
}

class MainInformation {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? temMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  MainInformation({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.temMax,
    this.pressure,
    this.humidity,
    this.grndLevel,
    this.seaLevel
  });

}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });
}

class Clouds {
  int? all;

  Clouds({
    this.all,
  });

}

class Sys {
  String? country;
  String? sunrise;
  String? sunset;

  Sys({
    this.country,
    this.sunrise,
    this.sunset,
  });
}
