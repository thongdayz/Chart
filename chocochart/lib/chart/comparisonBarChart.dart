// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class ComparisonBarChart extends CustomPainter {

  ///padding between the bars
  final double paddingY = 5;
  final double axisWidth = 2;

  /// Parameters
  late double barHeight;
  late double marginTopX = 0;
  late double marginTopY;
  late List barLeftData = [];
  late List barRightData = [];
  late TextPainter activeText;
  late TextPainter inactiveText;
  late List data;

  ComparisonBarChart(this.data, {this.barHeight = 30}){

    activeText = createText("Active", 1, color: Colors.deepOrange);
    inactiveText = createText("Inactive", 1, color: Colors.blueGrey);

    // define top axis (X) position and Sum of value.
    for(var item in data){

      barLeftData.add(item["data"]["Left"]["Value"]);
      barRightData.add(item["data"]["Right"]["Value"]);

      var text = createText(item["Label"], 1);
      if ((text.width + 5) > marginTopX) {
        marginTopX = text.width + 5;
      }
    }

    // define top axis (Y) position
    marginTopY = paddingY;
  }

  @override
  void paint(Canvas canvas, Size size) {

    // Create a new  instance.
    Paint axis = Paint()
      ..strokeWidth = axisWidth
      ..color = Colors.grey;

    // Draw axis (X,Y)
    drawAxes(canvas, size, axis);

    // Draw Bar
    int number = 0;
    for(var item in data){
      drawBarLabel(canvas, size, number, item["Label"]);
      drawBarRight(canvas, size, number, item["data"]["Right"]["Value"]);
      // drawBarRight(canvas, size, number, item["data"]["Left"]["Value"], color: Colors.blue);
      drawBarLeft(canvas, size, number, item["data"]["Left"]["Value"]);
      number++;
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double maxLeftValue() => barLeftData.reduce((value, element) => value + element);

  double maxRightValue() => barRightData.reduce((value, element) => value + element);

  void drawBarLabel(Canvas canvas, Size size, int number, String label) {
    double y = number * (paddingY + barHeight) + marginTopY + barHeight / 2;
    drawText(label, canvas, y: y);
  }

  void drawBarRight(Canvas canvas, Size size, int number, double value, {Color color = Colors.deepOrangeAccent}) {

    Paint paint = Paint()
      ..strokeWidth = barHeight
      ..color = color;

    double y = number * (paddingY + barHeight) + marginTopY + barHeight / 2;
    double p1 = (size.width / 2); // 100%
    double p2 = value;
    double p3 = (p2 / p1) * 100;
    double p4 = (p3 / 100) * p1;

    canvas.drawLine(
      Offset(p1, y),
      Offset((p1 + p4) , y),
      paint,
    );

    drawText("$p2", canvas, x: (p1 + p4) + 5, y: y, color: Colors.blue);
    activeText.paint(canvas, Offset((p1 + 5), (-10) - (activeText.height / 2)));
  }

  void drawBarLeft(Canvas canvas, Size size, int number, double value, {Color color = Colors.blueGrey}) {
    Paint paint = Paint()
      ..strokeWidth = barHeight
      ..color = color;

    double y = number * (paddingY + barHeight) + marginTopY + barHeight / 2;
    double p1 = (size.width / 2); // 100%
    double p2 = value;
    double p3 = (p2 / p1) * 100;
    double p4 = (p3 / 100) * p1;

    canvas.drawLine(
      Offset(p1 - p4, y),
      Offset(p1 , y),
      paint,
    );

    drawText("$p2", canvas, x: (p1 - p4) - 20, y: y, color: Colors.blue);
    inactiveText.paint(canvas, Offset((p1 - (inactiveText.width)), (-10) - (inactiveText.height / 2)));
  }

  void drawAxes(Canvas canvas, Size size, Paint axis) {
    axis.color = Colors.grey.shade500;

    // Draw axis (X)
    canvas.drawLine(
      Offset(marginTopX, data.length * (paddingY + barHeight) + marginTopY),
      Offset(size.width, data.length * (paddingY + barHeight) + marginTopY),
      axis,
    );

    // Draw axis (Y)
    canvas.drawLine(
      Offset(marginTopX, data.length * (paddingY + barHeight) + marginTopY),
      Offset(marginTopX, marginTopY - paddingY),
      axis,
    );
  }

  void drawText(String key, Canvas canvas, {double x = 0, double y = 0, Color? color = Colors.grey}) {
    TextPainter tp = createText(key, 1, color: color);
    tp.paint(canvas, Offset(x, y - tp.height / 2));
  }

  /// Create the text painter.
  TextPainter createText(String key, double scale, {Color? color = Colors.grey}) {
    TextSpan span = TextSpan(style: TextStyle(color: color), text: key);
    TextPainter tp = TextPainter(text: span, textAlign: TextAlign.left, textScaleFactor: scale, textDirection: TextDirection.ltr);
    tp.layout();
    return tp;
  }

}