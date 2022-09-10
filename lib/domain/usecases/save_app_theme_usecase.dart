import 'package:calc_clean_arch/domain/usecases/usecase.dart';

import '../../data/datasource/local/theme_preferences.dart';

class SaveAppThemeUseCase implements UseCase<bool, void> {
  final ThemePreferences _themePreferences;

  SaveAppThemeUseCase(this._themePreferences);

  @override
  Future<void> call({required bool params}) async {
    await _themePreferences.setDarkMode(params);
  }
}
