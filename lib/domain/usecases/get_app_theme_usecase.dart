import 'package:calc_clean_arch/domain/usecases/usecase.dart';

import '../../data/datasource/local/theme_preferences.dart';

class GetAppThemeUseCase implements UseCase<void, bool> {
  final ThemePreferences _themePreferences;

  GetAppThemeUseCase(this._themePreferences);

  @override
  Future<bool> call({void params}) async {
    return await _themePreferences.getIsDarkMode();
  }
}
