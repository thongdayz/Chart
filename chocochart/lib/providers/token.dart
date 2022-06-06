// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class TokenProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _token = "";

  String get token => _token;
  set token(String val) {
    _token = val;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Makes `TokenProvider` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('token', token));
  }
}
