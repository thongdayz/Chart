// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter

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

  final List _targets = [{
    "Target": "600",
    "Label": "80%",
    "Footer": "Target 1",
  }, {
    "Target": "800",
    "Label": "100%",
    "Footer": "Target 2",
  }];

  final List angles = [10.0, 20.0, 100.0, 150.0, 250.0, 300.0];
  final List colors = [Colors.green, Colors.blue, Colors.brown, Colors.pink, Colors.orange, Colors.grey.shade700];

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Chart Project", style: Theme.of(context).textTheme.titleLarge,),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Row(
              children: [

                Column(
                  children: [

                    // Padding(
                    //   padding: const EdgeInsets.only(top: 30.0, left: 30.0),
                    //   child: CustomPaint(
                    //     size: const Size.square(400),
                    //     painter: PieChartCustom(
                    //       angles: angles,
                    //       colors: colors,
                    //     ),
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 50.0),
                      child: CustomPaint(
                        painter: BarChartCustom(_barData, "Testing", targets: _targets),
                        child: Container(width: 800),
                      ),
                    ),

                  ],
                ),

              ],
            )
          ),
        ),
        onWillPop: () async => false);
  }
}