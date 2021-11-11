// To parse this JSON data, do
//
//     final mp = mpFromJson(jsonString);

import 'dart:convert';

Mp mpFromJson(String str) => Mp.fromJson(json.decode(str));

String mpToJson(Mp data) => json.encode(data.toJson());

class Mp {
  Mp({
    required this.type,
    required this.features,
  });

  String type;
  List<Feature> features;

  factory Mp.fromJson(Map<String, dynamic> json) => Mp(
    type: json["type"],
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
  };
}

class Feature {
  Feature({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  String type;
  Geometry geometry;
  Properties properties;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: json["type"],
    geometry: Geometry.fromJson(json["geometry"]),
    properties: Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "geometry": geometry.toJson(),
    "properties": properties.toJson(),
  };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<dynamic> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"],
    coordinates: List<dynamic>.from(json["coordinates"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class Properties {
  Properties({
    required this.stCode,
    required this.stName,
    required this.pcName,
    required this.pcType,
    required this.pcCode,
    required  this.area,
    required  this.pcNo,
    required  this.flag,
    required  this.pcHname,
    required  this.party,
  });

  String stCode;
  String stName;
  String pcName;
  String pcType;
  String pcCode;
  String area;
  String pcNo;
  String flag;
  String pcHname;
  String party;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    stCode: json["ST_CODE"],
    stName: json["ST_NAME"],
    pcName: json["PC_NAME"],
    pcType: json["PC_TYPE"],
    pcCode: json["PC_CODE"],
    area: json["AREA"],
    pcNo: json["PC_NO"],
    flag: json["FLAG"],
    pcHname: json["PC_HNAME"],
    party: json["PARTY"],
  );

  Map<String, dynamic> toJson() => {
    "ST_CODE": stCode,
    "ST_NAME": stName,
    "PC_NAME": pcName,
    "PC_TYPE": pcType,
    "PC_CODE": pcCode,
    "AREA": area,
    "PC_NO": pcNo,
    "FLAG": flag,
    "PC_HNAME": pcHname,
    "PARTY": party,
  };
}
