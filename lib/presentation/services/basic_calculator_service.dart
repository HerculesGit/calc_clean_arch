import 'package:calc_clean_arch/domain/entity/history.dart';
import 'package:calc_clean_arch/domain/usecases/get_histories_usecase.dart';

import '../../domain/usecases/calculate_arithmetic_operation_usecase.dart';
import '../../domain/usecases/convert_string_to_arithmetic_operations_usecase.dart';
import '../../domain/usecases/save_history_usecase.dart';

class BasicCalculatorService {
  final CalculateArithmeticOperationUseCase _calcUseCase;
  final ConvertStringToArithmeticOperationsUseCase
      _convertStringToArithmeticUseCase;

  final SaveHistoryUseCase _saveHistoryUseCase;
  final GetHistoriesUseCase _getHistoriesUseCase;

  BasicCalculatorService(
      this._calcUseCase,
      this._convertStringToArithmeticUseCase,
      this._saveHistoryUseCase,
      this._getHistoriesUseCase);

  Future<String> calculate(final String input) async {
    final List<String> termsInArray =
        await _convertStringToArithmeticUseCase.call(params: input);

    final String result = await _calcUseCase.call(params: termsInArray);
    return result;
  }

  Future<void> saveHistory(final String term) async {
    final historyEntity = HistoryEntity(term);
    await _saveHistoryUseCase.call(params: historyEntity);
  }

  Future<List<HistoryEntity>> getHistories() async =>
      await _getHistoriesUseCase.call(params: null);
}
