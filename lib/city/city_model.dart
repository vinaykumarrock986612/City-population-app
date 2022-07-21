import 'dart:convert';

// Becomes true if the API call fails
bool cityError = false;

CityModel cityFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.error,
    this.msg,
    this.data,
  });

  bool error;
  String msg;
  List<String> data;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    error: json["error"],
    msg: json["msg"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}




CityError cityErrorFromJson(String str) => CityError.fromJson(json.decode(str));

String cityErrorToJson(CityError data) => json.encode(data.toJson());

class CityError extends CityModel{
  CityError({
    this.error,
    this.msg,
  });

  bool error;
  String msg;

  factory CityError.fromJson(Map<String, dynamic> json) => CityError(
    error: json["error"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
  };
}

