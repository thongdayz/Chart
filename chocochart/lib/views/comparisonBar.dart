// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter
import 'dart:ui';
import 'package:chocochart/Chart/comparisonBarChart.dart';
import 'package:flutter/material.dart';
import 'package:chocochart/Chart/pieChart.dart';

class ComparisonBar extends StatefulWidget {

  const ComparisonBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComparisonBarState();

}

class _ComparisonBarState extends State<ComparisonBar> {

  final List data = [

    {
      "Label" : "Sale one",
      "data" : {
        "Left": {
          "Label": "Inactive",
          "Value": 50.0
        },
        "Right": {
          "Label": "Active",
          "Value": 200.0
        }
      }
    },
    {
      "Label" : "Sale two",
      "data" : {
        "Left": {
          "Label": "Inactive",
          "Value": 30.0
        },
        "Right": {
          "Label": "Active",
          "Value": 80.0
        }
      }
    },
    {
      "Label" : "Sale three",
      "data" : {
        "Left": {
          "Label": "Inactive",
          "Value": 20.0
        },
        "Right": {
          "Label": "Active",
          "Value": 90.0
        }
      }
    },
    {
      "Label" : "Sale four",
      "data" : {
        "Left": {
          "Label": "Inactive",
          "Value": 80.0
        },
        "Right": {
          "Label": "Active",
          "Value": 100.0
        }
      }
    },
    {
      "Label" : "Sale five",
      "data" : {
        "Left": {
          "Label": "Inactive",
          "Value": 10.0
        },
        "Right": {
          "Label": "Active",
          "Value": 300.0
        }
      }
    },

  ];

  @override
  void initState(){
    super.initState();
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
                      "SALE PERFORMANCE",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "KBOL Performance Update : Date as of 1 - 4 May 2022",
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 80.0, left: 30.0),
                      child: GestureDetector(
                        onTapDown: (pointer){
                          var offset = (context.findRenderObject() as RenderBox).globalToLocal(pointer.localPosition);
                          print(offset);
                        },
                        child: CustomPaint(
                          painter: ComparisonBarChart(data),
                          child: Container(width: 800, height: 200,),
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