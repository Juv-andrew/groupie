import 'package:flutter/material.dart';

class AppStateProvider with ChangeNotifier {
  // Contoh properti
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
