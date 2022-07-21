import 'dart:convert';

// Becomes true if the API call fails
bool countryError = false;

CountryModel countryFromJson(String str) =>
    CountryModel.fromJson(json.decode(str));

String countryToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    this.error,
    this.msg,
    this.data,
  });

  bool error;
  String msg;
  List<CountryData> data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        error: json["error"],
        msg: json["msg"],
        data: List<CountryData>.from(
            json["data"].map((x) => CountryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CountryData {
  CountryData({
    this.iso2,
    this.iso3,
    this.country,
    this.cities,
  });

  String iso2;
  String iso3;
  String country;
  List<String> cities;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        iso2: json["iso2"],
        iso3: json["iso3"],
        country: json["country"],
        cities: List<String>.from(json["cities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "iso2": iso2,
        "iso3": iso3,
        "country": country,
        "cities": List<dynamic>.from(cities.map((x) => x)),
      };
}

CountryError countryErrorFromJson(String str) =>
    CountryError.fromJson(json.decode(str));

String countryErrorToJson(CountryError data) => json.encode(data.toJson());

class CountryError extends CountryModel {
  CountryError({
    this.error,
    this.msg,
  });

  bool error;

  String msg;

  factory CountryError.fromJson(Map<String, dynamic> json) => CountryError(
        error: json["error"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
      };
}
