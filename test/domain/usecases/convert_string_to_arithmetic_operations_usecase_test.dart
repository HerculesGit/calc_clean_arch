import 'package:calc_clean_arch/domain/usecases/convert_string_to_arithmetic_operations_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ConvertStringToArithmeticOperationsUseCase sut;
  setUp(() {
    sut = ConvertStringToArithmeticOperationsUseCase();
  });

  group('ConvertStringToArithmeticOperations UseCase', () {
    test('should convert terms in array of the string', () async {
      List<String> termsInArray = await sut(params: '5x2+3x4-1');
      expect(termsInArray, ['5', 'x', '2', '+', '3', 'x', '4', '-', '1']);

      termsInArray = await sut(params: '10+10+10');
      expect(termsInArray, ['10', '+', '10', '+', '10']);

      termsInArray = await sut(params: '10+10+10+1');
      expect(termsInArray, ['10', '+', '10', '+', '10', '+', '1']);
    });
  });
}
