import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';

class CurrentWeatherModel extends CurrentWeatherResult {
  const CurrentWeatherModel({
    required Coordinates? coordinates,
    required List<Weather>? weatherList,
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

  factory CurrentWeatherModel.fromMap(Map<dynamic, dynamic> map) {
    return CurrentWeatherModel(
      //TODO ver esse tipo
      coordinates: CoordinatesModel.fromMap(map['coordinates']),
      weatherList: map['weatherList'] ,
      stations: map['stations'],
      mainInformation: MainInformationModel.fromMap(map['mainInformation']),
      visibility: map['visibility'],
      wind: WindModel.fromMap(map['wind']),
      clouds: CloudsModel.fromMap(map['clouds']),
      dt: map['dt'],
      sys: SysModel.fromMap(map['sys']),
      timezone: map['timezone'],
      id: map['id'],
      name: map['name'],
      cod: map['cod'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'coordinates': coordinates,
      'weatherList': weatherList,
      'stations': stations,
      'mainInformation': mainInformation,
      'visibility': visibility,
      'wind': wind,
      'clouds': clouds,
      'dt': dt,
      'sys': sys,
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
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

  Map<String, dynamic> toMap() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }
}

class WeatherModel extends Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherModel.fromMap(Map<dynamic, dynamic> map) {
    return WeatherModel(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}

class MainInformationModel extends MainInformation {
  final int? temp;
  final int? feelsLike;
  final int? tempMin;
  final int? temMax;
  final int? pressure;
  final int? humidity;

  const MainInformationModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.temMax,
    this.pressure,
    this.humidity,
  });

  factory MainInformationModel.fromMap(Map<dynamic, dynamic> map) {
    return MainInformationModel(
      temp: map['temp'],
      feelsLike: map['feelsLike'],
      tempMin: map['tempMin'],
      temMax: map['tempMax'],
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'temMax': temMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }
}

class WindModel extends Wind {
  final double? speed;
  final int? deg;

  const WindModel({
    this.speed,
    this.deg,
  });

  factory WindModel.fromMap(Map<dynamic, dynamic> map) {
    return WindModel(
      speed: map['speed'],
      deg: map['deg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }
}

class CloudsModel extends Clouds {
  final int? all;

  const CloudsModel({
    this.all,
  });

  factory CloudsModel.fromMap(Map<dynamic, dynamic> map) {
    return CloudsModel(
      all: map['all'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'all': all,
    };
  }
}

class SysModel extends Sys {
  final int? type;
  final int? id;
  final double? message;
  final String? country;
  final String? sunrise;
  final String? sunset;

  const SysModel({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysModel.fromMap(Map<dynamic, dynamic> map) {
    return SysModel(
      type: map['type'],
      id: map['id'],
      message: map['message'],
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
      'message': message,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }
}
