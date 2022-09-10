import 'package:calc_clean_arch/core/extensions.dart';
import 'package:calc_clean_arch/data/datasource/local/local_storage.dart';

class ThemePreferences {
  final LocalStorage _localStorage;
  static const prefsKey = 'prefs_key';

  ThemePreferences(this._localStorage);

  Future<void> setDarkMode(final bool isDark) async =>
      _localStorage.put(prefsKey, isDark.toString());

  Future<bool> getIsDarkMode() async {
    String? result =
        await _localStorage.get(prefsKey, defaultValue: false.toString());

    return result == null ? false : result.parseBool();
  }
}
