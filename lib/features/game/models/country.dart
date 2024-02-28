import 'package:flutter/material.dart';

class Country {
  Name? name;
  List<double>? latlng;
  int? distance;

  Country({
    this.name,
    this.latlng,
    this.distance,
  });

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    latlng = json['latlng'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['latlng'] = latlng;
    return data;
  }

  Color get color {
    if (distance! <= 2000) {
      return Colors.blue.shade300;
    } else if (distance! <= 4000) {
      return Colors.yellow.shade300;
    } else {
      return Colors.red.shade300;
    }
  }
}

class Name {
  String? common;
  String? official;

  Name({
    this.common,
    this.official,
  });

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    return data;
  }
}
