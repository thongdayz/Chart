// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

import 'dart:ui';


class Position {
  late Offset? p1;
  late Offset? p2;
  late double barHeight;
  late String value;

  Position({this.p1,  this.p2, this.barHeight = 0, this.value = ""});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
        p1: json["x"],
        p2: json["y"],
        barHeight: json["barHeight"],
        value : json["value"]
    );
  }

}