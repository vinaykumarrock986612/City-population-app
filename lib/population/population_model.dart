import 'dart:convert';

// Becomes true if the API call fails
bool populationError = false;

PopulationModel populationFromJson(String str) =>
    PopulationModel.fromJson(json.decode(str));

String populationToJson(PopulationModel data) => json.encode(data.toJson());

class PopulationModel {
  PopulationModel({
    this.error,
    this.msg,
    this.data,
  });

  bool error;
  String msg;
  Data data;

  factory PopulationModel.fromJson(Map<String, dynamic> json) =>
      PopulationModel(
        error: json["error"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.city,
    this.country,
    this.populationCounts,
  });

  String city;
  String country;
  List<PopulationModelCount> populationCounts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        city: json["city"],
        country: json["country"],
        populationCounts: List<PopulationModelCount>.from(
            json["populationCounts"]
                .map((x) => PopulationModelCount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "populationCounts":
            List<dynamic>.from(populationCounts.map((x) => x.toJson())),
      };
}

class PopulationModelCount {
  PopulationModelCount({
    this.year,
    this.value,
    this.sex,
    this.reliabilty,
  });

  String year;
  String value;
  String sex;
  String reliabilty;

  factory PopulationModelCount.fromJson(Map<String, dynamic> json) =>
      PopulationModelCount(
        year: json["year"],
        value: json["value"],
        sex: json["sex"],
        reliabilty: json["reliabilty"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "value": value,
        "sex": sex,
        "reliabilty": reliabilty,
      };
}

PopulationError populationErrorFromJson(String str) =>
    PopulationError.fromJson(json.decode(str));

String populationErrorToJson(PopulationError data) =>
    json.encode(data.toJson());

class PopulationError extends PopulationModel {
  PopulationError({
    this.error,
    this.msg,
  });

  bool error;
  String msg;

  factory PopulationError.fromJson(Map<String, dynamic> json) =>
      PopulationError(
        error: json["error"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
      };
}
