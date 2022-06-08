// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class PieChartCustom extends CustomPainter {
  late List angles, colors;
  late int angle;

  PieChartCustom( {required List angles, required List colors, int angle = 360})
  {
    this.angles = angles;
    this.colors = colors;
    this.angle = angle;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint p = Paint();
    double start = -90;
    double tmp = 0;

    for (int i = 0; i < angles.length; i++) {
      if (i < 5) {
        p.color = colors[i];
      } else {
        p.color = colors[5];
      }

      if (tmp + angles[i] < angle) {
        canvas.drawArc(Rect.fromLTRB(0, 0, size.width, size.height),
            vm.radians(start), vm.radians(angles[i]), true, p);

        start = start + angles[i];
        tmp = tmp + angles[i];
      } else {
        double x = angle - tmp;
        canvas.drawArc(Rect.fromLTRB(0, 0, size.width, size.height),
            vm.radians(start), vm.radians(x), true, p);
        return;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}