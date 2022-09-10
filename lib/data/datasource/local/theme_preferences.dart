import 'package:calc_clean_arch/data/datasource/local/local_storage.dart';

class ThemePreferences {
  final LocalStorage _localStorage;
  static const prefsKey = 'prefs_key';

  ThemePreferences(this._localStorage);

  setTheme(final bool isDark) async => _localStorage.put(prefsKey, isDark);

  getTheme() async => _localStorage.get(prefsKey, initialValue: false);
}
