// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

import 'dart:ui';

import 'package:chocochart/models/position.dart';

class PositionManager {

  static void valueReference(Offset pointer, {List<Position>? targets, Position? target})
  {
    // Exit function.
    if(targets == null && target == null) throw Exception('Both targets can not be null.');
    if(targets != null && target != null) throw Exception('Both targets can not assigned twice.');

    if(targets!.isNotEmpty) {
      // TODO: get value from position list object.

      print("targets.length ${targets.length}");

      for(Position p in targets) {

        print(" pointer.dx > ${pointer.dx} <> p.p1.dx > ${p.p1!.dx}, p.p2.dx > ${p.p2!.dx}");
        print(" pointer.dy > ${pointer.dy} <> p.p1.dy > ${p.p1!.dy}, p.p2.dy > ${p.p2!.dy}");


      }

    }
    else {
      // TODO: get value from position object.
    }

  }

}