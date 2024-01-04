import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  bool _isAlreadyDisplayed = false;
  bool get isAlreadyDisplayed => _isAlreadyDisplayed;
  void setIsAlreadyDisplayed(bool value) {
    _isAlreadyDisplayed = value;
    notifyListeners();
  }
}
