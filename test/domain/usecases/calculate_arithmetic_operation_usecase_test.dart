import 'package:calc_clean_arch/domain/usecases/calculate_arithmetic_operation_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CalculateArithmeticOperationUseCase sut;
  setUp(() {
    sut = CalculateArithmeticOperationUseCase();
  });

  group('ConvertStringToArithmeticOperations UseCase', () {
    test('should calculate the terms and returns the result', () async {
      String result =
          await sut(params: ['5', 'x', '2', '+', '3', 'x', '4', '-', '1']);
      expect(result, '21');

      result = await sut(params: ['5', 'x', '2']);
      expect(result, '10');

      result = await sut(params: ['5', '-', '2']);
      expect(result, '3');

      result = await sut(params: ['1', '-', '2']);
      expect(result, '-1');

      result = await sut(params: ['0', '-', '0']);
      expect(result, '0');

      result = await sut(params: ['1000000000000', '+', '1']);
      expect(result, '1000000000001');

      result = await sut(params: ['0', '+', '10']);
      expect(result, '10');

      result = await sut(params: ['1230', '+', '10']);
      expect(result, '1240');

      result = await sut(params: ['10', '+', '100']);
      expect(result, '110');
      result = await sut(params: ['1', '+', '100']);
      expect(result, '101');

      result = await sut(params: ['100', '+', '10']);
      expect(result, '110');
      result = await sut(params: ['100', '+', '1']);
      expect(result, '101');

      result = await sut(params: ['100', '+', '200']);
      expect(result, '300');
      result = await sut(params: ['200', '+', '100']);
      expect(result, '300');
    });
  });
}
