import 'domain/usecases/calculate_arithmetic_operation_usecase.dart';
import 'domain/usecases/convert_string_to_arithmetic_operations_usecase.dart';
import 'presentation/services/basic_calculator_service.dart';

Future<void> intDependencies() async {}

BasicCalculatorService initBasicServiceDependencies() {
  return BasicCalculatorService(CalculateArithmeticOperationUseCase(),
      ConvertStringToArithmeticOperationsUseCase());
}
