import 'package:calc_clean_arch/data/datasource/local/local_storage.dart';
import 'package:calc_clean_arch/data/datasource/local/theme_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LocalStorageSpy extends Mock implements LocalStorage {}

void main() {
  late ThemePreferences themePreferences;
  late LocalStorageSpy localStorageSpy;

  setUp(() {
    localStorageSpy = LocalStorageSpy();
    themePreferences = ThemePreferences(localStorageSpy);
  });

  test('should call setTheme method with correct key', () async {
    await themePreferences.setDarkMode(false);
    verify(localStorageSpy.put(ThemePreferences.prefsKey, false.toString()))
        .called(1);
  });

  test('should call getTheme method with correct key', () async {
    await themePreferences.getIsDarkMode();
    verify(localStorageSpy.get(ThemePreferences.prefsKey,
            defaultValue: false.toString()))
        .called(1);
  });
}
