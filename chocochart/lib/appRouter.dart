// ignore_for_file: file_names, avoid_print
import 'package:chocochart/views/comparisonBar.dart';
import 'package:chocochart/views/landing.dart';
import 'package:chocochart/views/pie.dart';
import 'package:flutter/material.dart';
import 'models/routingData.dart';

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return RoutingData(route: uriData.path, queryParameters: uriData.queryParameters);
  }
}

class AppRouter {
  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  Route<dynamic> generateRoute(RouteSettings settings) {
    var routingData = settings.name?.getRoutingData;

    switch (routingData?.route) {
      case '/landing':
        return MaterialPageRoute(builder: (_) => const Landing(), settings: settings);
      case '/pie':
        return MaterialPageRoute(builder: (_) => const Pie(), settings: settings);
      case '/sale/comparison':
        return MaterialPageRoute(builder: (_) => const ComparisonBar(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => const Landing(), settings: settings,);
    }
  }
}
