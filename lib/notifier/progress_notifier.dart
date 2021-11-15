import 'package:flutter/cupertino.dart';

class ProgressLoadNotifier extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  set isLoading(bool duty) {
    _isLoading = duty;
    notifyListeners();
  }

  void reset() {
    _isLoading = false;
  }
}