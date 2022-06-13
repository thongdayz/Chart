// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter, prefer_final_fields

import 'dart:math';
import 'package:chocochart/models/position.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vm;

class ComparisonBarChart extends CustomPainter {

  //padding between the bars
  final double paddingY = 5;
  final double axisWidth = 2;

  // Parameters

  /// The data field is a mandatory.
  late List data;
  /// This field can define height of bar chart.
  late double barHeight;
  /// The reference field is refer value that you want to add to the Position Object.
  /// This field is used for interactive with charts such as the 'CLICK' event on the chart.
  /// Let's see the example.
  late String reference;

  // private field and not accessible.
  late double _marginTopX = 0;
  late double _marginTopY;
  late List _barLeftData = [];
  late List _barRightData = [];
  late List<Position> _positionData = [];
  late TextPainter _activeText;
  late TextPainter _inactiveText;


  ComparisonBarChart(this.data, {this.barHeight = 30, this.reference = ""}){

    _activeText = createText("Active", 1, color: Colors.deepOrange);
    _inactiveText = createText("Inactive", 1, color: Colors.blueGrey);

    // define top axis (X) position and Sum of value.
    for(var item in data){
      _barLeftData.add(item["data"]["Left"]["Value"]);
      _barRightData.add(item["data"]["Right"]["Value"]);

      var text = createText(item["Label"], 1);
      if ((text.width + 5) > _marginTopX) {
        _marginTopX = text.width + 5;
      }
    }

    // define top axis (Y) position
    _marginTopY = paddingY;
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
      drawBarRight(canvas, size, number, item["data"]["Right"]["Value"], valueReference: item[reference]);
      // drawBarRight(canvas, size, number, item["data"]["Left"]["Value"], color: Colors.blue);
      drawBarLeft(canvas, size, number, item["data"]["Left"]["Value"], valueReference: item[reference]);
      number++;
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double get chartHeight => (data.length * (paddingY + barHeight) + _marginTopY);

  List<Position> get positions => _positionData;

  void drawBarLabel(Canvas canvas, Size size, int number, String label) {
    double y = number * (paddingY + barHeight) + _marginTopY + barHeight / 2;
    drawText(label, canvas, y: y);
  }

  void drawBarRight(Canvas canvas, Size size, int number, double value, {Color color = Colors.deepOrangeAccent, String valueReference = ""}) {

    Paint paint = Paint()
      ..strokeWidth = barHeight
      ..color = color;

    double y = (number * (paddingY + barHeight)) + _marginTopY + (barHeight / 2);
    double p1 = (size.width / 2); // 100%
    double p2 = value;
    double p3 = (p2 / p1) * 100;
    double p4 = (p3 / 100) * p1;

    canvas.drawLine(
      Offset(p1, y),
      Offset((p1 + p4) , y),
      paint,
    );

    // Set value position
    Position p = Position();
    p.p1 = Offset(p1, y);
    p.p2 = Offset((p1 + p4) , y);
    p.value = valueReference;
    p.barHeight = barHeight;
    _positionData.add(p);

    drawText("$p2", canvas, x: (p1 + p4) + 5, y: y, color: Colors.blue);
    _activeText.paint(canvas, Offset((p1 + 5), (-10) - (_activeText.height / 2)));
  }

  void drawBarLeft(Canvas canvas, Size size, int number, double value, {Color color = Colors.blueGrey, String valueReference = ""}) {
    Paint paint = Paint()
      ..strokeWidth = barHeight
      ..color = color;

    double y = (number * (paddingY + barHeight)) + _marginTopY + (barHeight / 2);
    double p1 = (size.width / 2); // 100%
    double p2 = value;
    double p3 = (p2 / p1) * 100;
    double p4 = (p3 / 100) * p1;

    canvas.drawLine(
      Offset((p1 - p4), y),
      Offset(p1 , y),
      paint,
    );

    // Set value position
    Position p = Position();
    p.p1 = Offset((p1 - p4), y);
    p.p2 = Offset(p1 , y);
    p.barHeight = barHeight;
    p.value = valueReference;
    _positionData.add(p);

    drawText("$p2", canvas, x: (p1 - p4) - 20, y: y, color: Colors.blue);
    _inactiveText.paint(canvas, Offset((p1 - (_inactiveText.width)), (-10) - (_inactiveText.height / 2)));
  }

  void drawAxes(Canvas canvas, Size size, Paint axis) {
    axis.color = Colors.grey.shade500;

    // Draw axis (X)
    canvas.drawLine(
      Offset(_marginTopX, data.length * (paddingY + barHeight) + _marginTopY),
      Offset(size.width, data.length * (paddingY + barHeight) + _marginTopY),
      axis,
    );

    // Draw axis (Y)
    canvas.drawLine(
      Offset(_marginTopX, data.length * (paddingY + barHeight) + _marginTopY),
      Offset(_marginTopX, _marginTopY - paddingY),
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