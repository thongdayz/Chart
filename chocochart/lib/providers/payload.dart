// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class PayloadProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _payload = "";

  String get payload => _payload;
  set payload(String val) {
    _payload = val;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Makes `PayloadProvider` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('payload', payload));
  }
}
