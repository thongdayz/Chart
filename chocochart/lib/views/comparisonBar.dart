// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, avoid_web_libraries_in_flutter
import 'dart:convert';
import 'dart:ui';
import 'package:chocochart/Chart/comparisonBarChart.dart';
import 'package:chocochart/chart/positionManager.dart';
import 'package:chocochart/models/enums.dart';
import 'package:chocochart/models/position.dart';
import 'package:flutter/foundation.dart';
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
      "Id" : "1",
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
      "Id" : "2",
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
      "Id" : "3",
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
      "Id" : "4",
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
      "Id" : "5",
      "Label" : "Sale five",
      "data" : {
        "Left": {
          "Label": "Inactive",
          "Value": 50.0
        },
        "Right": {
          "Label": "Active",
          "Value": 300.0
        }
      }
    },

  ];

  late ComparisonBarChart painter;
  late List<Position> position;

  @override
  void initState(){
    super.initState();

    // TODO: initial chart and passing the data.
    painter = ComparisonBarChart(data, reference: 'Id');
    position = [];
  }

  @override
  Widget build(BuildContext context) {

    double dimensionWidth = MediaQuery.of(context).size.width;
    double dimensionHeight = MediaQuery.of(context).size.height;

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
              width: dimensionWidth,
              height: dimensionHeight,
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
                          Offset offset = (context.findRenderObject() as RenderBox).globalToLocal(pointer.localPosition);
                          var p = PositionManager.getBarChatValueRef(offset, targets: painter.positions);

                          if(kDebugMode){
                            print("Value >>>> ${p.value}");
                          }
                        },
                        child: CustomPaint(
                          painter: painter,
                          child: SizedBox(width: 800, height: painter.chartHeight,),
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