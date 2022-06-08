// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:chocochart/Chart/pieChart.dart';
import 'package:chocochart/Chart/barChart.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final Map<String, int> _barData = {
    "Banana": 16,
    "Orange": 8,
    "Apple": 10,
    "Kiwi": 10,
    "Pear": 3,
    "Teenat": 16,
    "Puvelat": 8,
    "Areeya": 10,
    "May": 10,
    "Google": 3
  };

  final List _targets = [
    {
      "Target": "600",
      "Label": "80%",
      "Footer": "Target 1",
    },
    {
      "Target": "800",
      "Label": "100%",
      "Footer": "Target 2",
    }
  ];

  final List angles = [10.0, 20.0, 100.0, 150.0, 250.0, 300.0];
  final List colors = [Colors.green, Colors.blue, Colors.brown, Colors.pink, Colors.orange, Colors.grey.shade700];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                      "RM - Top PERFORMANCE",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "KBOL Performance Update : Date as of 1 - 4 May 2022",
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: CustomPaint(
                        painter: BarChartCustom(_barData, "", targets: _targets),
                        child: Container(
                          color: Colors.transparent,
                          height: 200,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color.fromRGBO(0, 0, 0, .5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                                      ),
                                    ),
                                    const Text(
                                      "บรรลุเป้าหมาย 100%",
                                      style: TextStyle(color: Colors.black, fontSize: 14,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                                      ),
                                    ),
                                    const Text(
                                      "บรรลุเป้าหมาย 30%",
                                      style: TextStyle(color: Colors.black, fontSize: 14,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                      ),
                                    ),
                                    const Text(
                                      "บรรลุเป้าหมาย <= 30%",
                                      style: TextStyle(color: Colors.black, fontSize: 14,),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
