import 'package:flutter/material.dart';

import '../../config/themes.dart';

class AppThemeController extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  AppThemeController() {
    _isDark = false;
  }

  set isDark(bool isDark) {
    _isDark = isDark;
    AppTheme.changeThemeMode(_isDark);
    notifyListeners();
  }
}
