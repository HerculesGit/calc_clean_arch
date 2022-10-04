import 'package:flutter/material.dart';

const kDisplayResultTextStyle = TextStyle();

const kDefaultMargin = 16.0;

class AppTheme {
  static bool _isDark = false;

  static changeThemeMode(bool isDark) async {
    _isDark = isDark;
  }

  static bool get isDark => _isDark;

  static Color get primaryColor {
    return (_isDark) ? const Color(0xFF18AC91) : const Color(0xFF18AC91);
  }

  static Color get secondaryColor {
    return (_isDark) ? const Color(0xFFE69291) : const Color(0xFFE69291);
  }

  static Color get backgroundColor {
    return (_isDark) ? const Color(0xFF22252D) : const Color(0xFFFFFFFF);
  }

  static Color get backgroundCardColor {
    return (_isDark) ? const Color(0xFF2A2D37) : const Color(0xFFF9F9F9);
  }

  static Color get enabledAccentColor {
    return (_isDark) ? const Color(0xFFFFFFFF) : const Color(0xFF272831);
  }

  static Color get disabledAccentColor {
    return (_isDark) ? const Color(0xFF4C4F57) : const Color(0xFFE2E2E2);
  }

  static Color get textColor {
    return (_isDark) ? const Color(0xFFFFFFFF) : const Color(0xFF272831);
  }

  static get displayTermTextStyle {
    return TextStyle(fontSize: 20, color: AppTheme.textColor);
  }

  static get displayResultTextStyle {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 45.0, color: AppTheme.textColor);
  }
}
