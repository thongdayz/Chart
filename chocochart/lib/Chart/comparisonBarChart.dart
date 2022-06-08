// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class ComparisonBarChart extends CustomPainter {

  ///padding between the bars
  final double paddingY = 5;
  final double axisWidth = 2;
  final double barHeight = 30;

  /// Parameters
  late double marginTopX = 0;
  late double marginTopY;
  late List? targets;

  late List data = [

    {
      "Name" : "Sale one",
      "data" : {
        "Left": {
          "Label": "Inactive",
          "Value": 50
        },
        "Right": {
          "Label": "Active",
          "Value": 50
        }
      }
    },

  ];


  // int maxValue() => data.values.reduce(max);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint axis = Paint()
      ..strokeWidth = axisWidth
      ..color = Colors.grey;

    drawAxes(canvas, size, axis);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void drawAxes(Canvas canvas, Size size, Paint axis) {
    axis.color = Colors.grey.shade100;

    // canvas.drawLine(
    //   Offset(marginTopX, data.entries.length * (paddingY + barHeight) + marginTopY),
    //   Offset(size.width, data.entries.length * (paddingY + barHeight) + marginTopY),
    //   axis,
    // );
    //
    // canvas.drawLine(
    //   Offset(marginTopX, data.entries.length * (paddingY + barHeight) + marginTopY),
    //   Offset(marginTopX, marginTopY - paddingY),
    //   axis,
    // );
  }

}