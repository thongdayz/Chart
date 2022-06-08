// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter

import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui';

class BarChartCustom extends CustomPainter {
  late final String title;
  late final Map<String, int> data;

  // Currently based on the length of the category names
  late double marginTopX = 0;
  late double marginTopY;
  // Target
  late List? targets;

  //padding between the bars
  final double paddingY = 5;
  final double axisWidth = 2;
  final double barHeight = 30;

  int maxValue() => data.values.reduce(max);

  BarChartCustom(this.data, this.title, {this.targets}) {
    // determine where to begin with X, based on the width of the category names
    data.forEach((key, value) {
      var text = createText(key, 1);
      if ((text.width + 5) > marginTopX) {
        marginTopX = text.width + 5;
      }
    });
    marginTopY = createText(title, 1.5).height + paddingY;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint axis = Paint()
      ..strokeWidth = axisWidth
      ..color = Colors.grey;

    double number = 0;
    data.forEach((key, value) {
      drawBar(canvas, size, number, key, value);
      number++;
    });
    drawAxes(canvas, size, axis);
    drawTitle(canvas, size);

    // Draw target
    if (targets != null) {
      targets?.forEach((value) {
        if (value["Target"].toString().isNotEmpty) {
          drawTarget(canvas, size, value, axis);


          drawTriangle(canvas, size, value, axis);
        }
      });
    }
    
  }

  void drawTitle(Canvas canvas, Size size) {
    TextPainter tp = createText(title, 1.5, color: Colors.grey.shade600);
    tp.paint(canvas, Offset(size.width / 2 - tp.width / 2, 0));
  }

  void drawAxes(Canvas canvas, Size size, Paint axis) {
    axis.color = Colors.grey.shade100;

    canvas.drawLine(
      Offset(marginTopX, data.entries.length * (paddingY + barHeight) + marginTopY),
      Offset(size.width, data.entries.length * (paddingY + barHeight) + marginTopY),
      axis,
    );
    canvas.drawLine(
      Offset(marginTopX, data.entries.length * (paddingY + barHeight) + marginTopY),
      Offset(marginTopX, marginTopY - paddingY),
      axis,
    );
  }

  void drawTarget(Canvas canvas, Size size, Map<String, String> targets, Paint axis) {
    if (targets["Target"].toString().isNotEmpty) {
      double target = double.parse(targets["Target"].toString());
      int dashWidth = 5;
      int interval = (data.entries.length * (paddingY + barHeight) + marginTopY) as int;

      // Change Color
      axis.color = const Color.fromRGBO(112, 112, 112, 1);

      for (var i = 0; i < interval;) {
        double startY = i as double;
        canvas.drawLine(Offset(target, (startY)), Offset(target, (startY + dashWidth)), axis);

        i = i + 10;
      }

      drawText(targets["Label"].toString(), canvas, x: target - 5, y: -10, color: Colors.black);
      drawText(targets["Footer"].toString(), canvas, x: target - 5, y: double.parse(interval.toString()) + 10, color: Colors.green.shade700);
    }
  }

  void drawBar(Canvas canvas, Size size, double number, String key, int value) {
    double y = number * (paddingY + barHeight) + marginTopY + barHeight / 2;

    drawText(key, canvas, y: y);

    Paint paint = Paint()
      ..strokeWidth = barHeight
      ..color = Colors.green;

    if (value <= 5) {
      paint.color = Colors.deepOrangeAccent;
    } else if (value > 5 && value <= 10) {
      paint.color = Colors.orangeAccent;
    } else {
      paint.color = Colors.green;
    }

    canvas.drawLine(
      Offset(marginTopX, y),
      Offset((size.width - marginTopX) / (maxValue() / value) + marginTopX, y),
      paint,
    );

    drawText("$value", canvas, x: ((size.width - marginTopX) / (maxValue() / value) + marginTopX) - 50, y: y, color: Colors.white);
    drawText("$value", canvas, x: ((size.width - marginTopX) / (maxValue() / value) + marginTopX) + 20, y: y, color: Colors.orange);
  }

  void drawText(String key, Canvas canvas, {double x = 0, double y = 0, Color? color = Colors.grey}) {
    TextPainter tp = createText(key, 1, color: color);
    tp.paint(canvas, Offset(x, y - tp.height / 2));
  }

  TextPainter createText(String key, double scale, {Color? color = Colors.grey}) {
    TextSpan span = TextSpan(style: TextStyle(color: color), text: key);
    TextPainter tp = TextPainter(text: span, textAlign: TextAlign.left, textScaleFactor: scale, textDirection: TextDirection.ltr);
    tp.layout();
    return tp;
  }

  void drawTriangle(Canvas canvas, Size size, Map<String, String> targets, Paint axis) {
    if (targets["Target"].toString().isNotEmpty) {
      double target = double.parse(targets["Target"].toString());
      int dashWidth = 5;
      int interval = (data.entries.length * (paddingY + barHeight) + marginTopY) as int;

      // Change Color
      axis.color = const Color.fromRGBO(112, 112, 112, 1);

      Path pathTriangle = Path()
        ..moveTo(10 / 2, 0)
        ..lineTo(0, 10)
        ..lineTo(10, 10)
        ..close();

      canvas.drawPath(pathTriangle, axis);

      // drawText(targets["Label"].toString(), canvas, x: target - 5, y: -10, color: Colors.black);
      // drawText(targets["Footer"].toString(), canvas, x: target - 5, y: double.parse(interval.toString()) + 10, color: Colors.green.shade700);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
