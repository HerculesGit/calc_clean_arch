import 'package:calc_clean_arch/domain/repositories/history_repository.dart';
import 'package:calc_clean_arch/domain/usecases/calculate_arithmetic_operation_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/convert_string_to_arithmetic_operations_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/get_histories_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/ignore_new_zero_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/save_history_usecase.dart';
import 'package:calc_clean_arch/presentation/services/basic_calculator_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HistoryRepositorySpy extends Mock implements HistoryRepository {}

void main() {
  group('BasicCalculatorController', () {
    test('should receive a terms string and return a correct result', () async {
      BasicCalculatorService service = BasicCalculatorService(
          CalculateArithmeticOperationUseCase(),
          ConvertStringToArithmeticOperationsUseCase(),
          IgnoreNewZeroUseCase(),
          SaveHistoryUseCase(HistoryRepositorySpy()),
          GetHistoriesUseCase(HistoryRepositorySpy()));

      String result = '';
      result = await service.calculate('2x2-4-3-5+10');
      expect(result, '2');
      result = await service.calculate('8+2x1x0x8x0x1-52528x8-3+7x86573');
      expect(result, '185792');
    });
  });
}
