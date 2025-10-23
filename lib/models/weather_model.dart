import 'dart:convert';

/// coord : {"lon":-0.13,"lat":51.51}
/// weather : [{"id":300,"main":"Drizzle","description":"light intensity drizzle","icon":"09d"}]
/// base : "stations"
/// main : {"temp":280.32,"pressure":1012,"humidity":81,"temp_min":279.15,"temp_max":281.15}
/// visibility : 10000
/// wind : {"speed":4.1,"deg":80}
/// clouds : {"all":90}
/// dt : 1485789600
/// sys : {"type":1,"id":5091,"message":0.0103,"country":"GB","sunrise":1485762037,"sunset":1485794875}
/// id : 2643743
/// name : "London"
/// cod : 200

WeatherModel weatherModelFromJson(String str) => WeatherModel.fromJson(json.decode(str));
String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  const WeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
    weather: json['weather'] != null
        ? List<Weather>.from(json['weather'].map((x) => Weather.fromJson(x)))
        : null,
    base: json['base'],
    main: json['main'] != null ? Main.fromJson(json['main']) : null,
    visibility: json['visibility'],
    wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
    clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
    dt: json['dt'],
    sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
    id: json['id'],
    name: json['name'],
    cod: json['cod'],
  );

  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final num? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final num? dt;
  final Sys? sys;
  final num? id;
  final String? name;
  final num? cod;

  get cityName => null;

  WeatherModel copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,
    Sys? sys,
    num? id,
    String? name,
    num? cod,
  }) =>
      WeatherModel(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        base: base ?? this.base,
        main: main ?? this.main,
        visibility: visibility ?? this.visibility,
        wind: wind ?? this.wind,
        clouds: clouds ?? this.clouds,
        dt: dt ?? this.dt,
        sys: sys ?? this.sys,
        id: id ?? this.id,
        name: name ?? this.name,
        cod: cod ?? this.cod,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = base;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['visibility'] = visibility;
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['id'] = id;
    map['name'] = name;
    map['cod'] = cod;
    return map;
  }
}

/// type : 1
/// id : 5091
/// message : 0.0103
/// country : "GB"
/// sunrise : 1485762037
/// sunset : 1485794875

Sys sysFromJson(String str) => Sys.fromJson(json.decode(str));
String sysToJson(Sys data) => json.encode(data.toJson());

class Sys {
  const Sys({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json['type'],
    id: json['id'],
    message: json['message'],
    country: json['country'],
    sunrise: json['sunrise'],
    sunset: json['sunset'],
  );

  final num? type;
  final num? id;
  final num? message;
  final String? country;
  final num? sunrise;
  final num? sunset;

  Sys copyWith({
    num? type,
    num? id,
    num? message,
    String? country,
    num? sunrise,
    num? sunset,
  }) =>
      Sys(
        type: type ?? this.type,
        id: id ?? this.id,
        message: message ?? this.message,
        country: country ?? this.country,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['message'] = message;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

/// all : 90

Clouds cloudsFromJson(String str) => Clouds.fromJson(json.decode(str));
String cloudsToJson(Clouds data) => json.encode(data.toJson());

class Clouds {
  const Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json['all'],
  );

  final num? all;

  Clouds copyWith({
    num? all,
  }) =>
      Clouds(
        all: all ?? this.all,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

/// speed : 4.1
/// deg : 80

Wind windFromJson(String str) => Wind.fromJson(json.decode(str));
String windToJson(Wind data) => json.encode(data.toJson());

class Wind {
  const Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json['speed'],
    deg: json['deg'],
  );

  final num? speed;
  final num? deg;

  Wind copyWith({
    num? speed,
    num? deg,
  }) =>
      Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }
}

/// temp : 280.32
/// pressure : 1012
/// humidity : 81
/// temp_min : 279.15
/// temp_max : 281.15

Main mainFromJson(String str) => Main.fromJson(json.decode(str));
String mainToJson(Main data) => json.encode(data.toJson());

class Main {
  const Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json['temp'],
    pressure: json['pressure'],
    humidity: json['humidity'],
    tempMin: json['temp_min'],
    tempMax: json['temp_max'],
  );

  final num? temp;
  final num? pressure;
  final num? humidity;
  final num? tempMin;
  final num? tempMax;

  Main copyWith({
    num? temp,
    num? pressure,
    num? humidity,
    num? tempMin,
    num? tempMax,
  }) =>
      Main(
        temp: temp ?? this.temp,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    return map;
  }
}

/// id : 300
/// main : "Drizzle"
/// description : "light intensity drizzle"
/// icon : "09d"

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  const Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json['id'],
    main: json['main'],
    description: json['description'],
    icon: json['icon'],
  );

  final num? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather copyWith({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      Weather(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

/// lon : -0.13
/// lat : 51.51

Coord coordFromJson(String str) => Coord.fromJson(json.decode(str));
String coordToJson(Coord data) => json.encode(data.toJson());

class Coord {
  const Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json['lon'],
    lat: json['lat'],
  );

  final num? lon;
  final num? lat;

  Coord copyWith({
    num? lon,
    num? lat,
  }) =>
      Coord(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}
