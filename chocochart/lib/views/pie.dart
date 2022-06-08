// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:chocochart/Chart/pieChart.dart';

class Pie extends StatefulWidget {

  const Pie({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PieState();

}

class _PieState extends State<Pie> {
  @override
  Widget build(BuildContext context) {

    double dimentionsWidth = MediaQuery.of(context).size.width;
    double dimentionsHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Chart Project",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: dimentionsWidth,
              height: dimentionsHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PIE CHART PERFORMANCE",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "KBOL Performance Update : Date as of 1 - 4 May 2022",
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 30.0),
                      child: CustomPaint(
                        size: const Size.square(400),
                        painter: PieChartCustom(
                          angles: [10.0, 20.0, 100.0, 150.0, 250.0, 300.0],
                          colors: [Colors.green, Colors.blue, Colors.brown, Colors.pink, Colors.orange, Colors.grey.shade700],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}