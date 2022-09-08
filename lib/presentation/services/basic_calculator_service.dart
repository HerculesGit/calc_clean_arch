import '../../domain/usecases/calculate_arithmetic_operation_usecase.dart';
import '../../domain/usecases/convert_string_to_arithmetic_operations_usecase.dart';

class BasicCalculatorService {
  final CalculateArithmeticOperationUseCase _calcUseCase;
  final ConvertStringToArithmeticOperationsUseCase
      _convertStringToArithmeticUseCase;

  BasicCalculatorService(
      this._calcUseCase, this._convertStringToArithmeticUseCase);

  Future<String> calculate(final String input) async {
    final List<String> termsInArray =
        await _convertStringToArithmeticUseCase.call(params: input);

    final String result = await _calcUseCase.call(params: termsInArray);
    return result;
  }
}
