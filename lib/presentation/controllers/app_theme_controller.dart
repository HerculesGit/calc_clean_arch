import 'package:flutter/material.dart';

import '../../config/themes.dart';
import '../../domain/usecases/get_app_theme_usecase.dart';
import '../../domain/usecases/save_app_theme_usecase.dart';

class AppThemeController extends ChangeNotifier {
  final SaveAppThemeUseCase _saveAppThemeUseCase;
  final GetAppThemeUseCase _getAppThemeUseCase;

  bool _isDark = false;

  bool get isDark => _isDark;

  AppThemeController(this._saveAppThemeUseCase, this._getAppThemeUseCase) {
    _isDark = false;
    _loadAppTheme();
  }

  set isDark(bool isDark) {
    _isDark = isDark;
    AppTheme.changeThemeMode(_isDark);
    notifyListeners();

    _saveAppThemeUseCase.call(params: _isDark);
  }

  _loadAppTheme() async {
    isDark = await _getAppThemeUseCase();
  }
}
