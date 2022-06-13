// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

import 'dart:ui';

import 'package:chocochart/models/enums.dart';
import 'package:chocochart/models/position.dart';
import 'package:flutter/foundation.dart';

class PositionManager {

  static Position getBarChatValueRef(Offset pointer, {List<Position>? targets, Position? target})
  {
    // Exit function.
    if(targets == null && target == null) throw Exception('Both targets can not be null.');
    if(targets != null && target != null) throw Exception('Both targets can not assigned twice.');

    if(targets!.isNotEmpty) {
      // TODO: get value from position list object.
      for(Position p in targets) {

        if(pointer.dy >= (p.p1!.dy - (p.barHeight / 2)) && pointer.dy <= (p.p1!.dy + (p.barHeight / 2)) )
        {
          if(pointer.dx >= p.p1!.dx && pointer.dx <= p.p2!.dx)
          {
            // if (kDebugMode) {
            //   print("(CLICK) >> pointer $pointer >> Position ${p.p1} ${p.p2} value: ${p.value}");
            // }
            return p;
          }
        }

      } // End Loop
    }
    else {
      // TODO: get value from position object.
    }

    return Position();

  }

}