import 'package:calc_clean_arch/data/repositories/history_repository.dart';
import 'package:calc_clean_arch/domain/repositories/history_repository.dart';
import 'package:calc_clean_arch/domain/usecases/get_histories_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/save_history_usecase.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/local/shared_preferences_local_storage.dart';
import 'data/datasource/local/theme_preferences.dart';
import 'domain/usecases/calculate_arithmetic_operation_usecase.dart';
import 'domain/usecases/convert_string_to_arithmetic_operations_usecase.dart';
import 'domain/usecases/get_app_theme_usecase.dart';
import 'domain/usecases/save_app_theme_usecase.dart';
import 'presentation/services/basic_calculator_service.dart';

GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPrefs = SharedPreferencesLocalStorage();
  await sharedPrefs.init();

  injector.registerSingleton<HistoryRepository>(
      HistoryRepositoryDataSource(sharedPrefs));

  injector.registerSingleton<CalculateArithmeticOperationUseCase>(
      CalculateArithmeticOperationUseCase());

  injector.registerSingleton<ConvertStringToArithmeticOperationsUseCase>(
      ConvertStringToArithmeticOperationsUseCase());

  injector
      .registerSingleton<SaveHistoryUseCase>(SaveHistoryUseCase(injector()));
  injector
      .registerSingleton<GetHistoriesUseCase>(GetHistoriesUseCase(injector()));

  injector.registerSingleton<ThemePreferences>(ThemePreferences(sharedPrefs));

  injector
      .registerSingleton<SaveAppThemeUseCase>(SaveAppThemeUseCase(injector()));
  injector
      .registerSingleton<GetAppThemeUseCase>(GetAppThemeUseCase(injector()));

  injector.registerSingleton<BasicCalculatorService>(
      BasicCalculatorService(injector(), injector(), injector(), injector()));
}
