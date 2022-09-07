import 'package:calc_clean_arch/domain/usecases/addition_use_case.dart';
import 'package:calc_clean_arch/domain/usecases/extract_string_to_arithmetic_operations_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ExtractStringToArithmeticOperationsUseCase sut;
  setUp(() {
    sut = ExtractStringToArithmeticOperationsUseCase();
  });

  group('ExtractStringToArithmeticOperations UseCase', () {
    test('should convert 5x2+3x4-1 terms in array of the string', () {
      List<String> termsInArray = sut.convertStringTermsInList('5x2+3x4-1');
      expect(termsInArray, ['5', 'x', '2', '+', '3', 'x', '4', '-', '1']);

      termsInArray = sut.convertStringTermsInList('10+10+10');
      expect(termsInArray, ['10', '+', '10', '+', '10']);
    });

    test('should calculate the term 5x2+3x4-1 and returns the 21 value',
        () async {
      final result = await sut(params: '5x2+3x4-1');
      expect(result, '21');
    });

    test(
        'should calculate only addition single term and returns a correct value',
        () async {
      String result = await sut(params: '2+3');
      expect(result, '5');
    });

    test('should calculate multiple addition terms and returns a correct value',
        () async {
      String result = await sut(params: '2+3+10');
      expect(result, '15');

      // result = await sut(params: '2+3+10+5+2+1+0+4+5');
      // expect(result, '32');
    });

    //   test('should calculate subtraction double term and returns a correct value',
    //       () async {
    //     String result = await sut(params: '2-3-8');
    //     expect(result, '-9');
    //
    //     result = await sut(params: '3-1-0');
    //     expect(result, '2');
    //   });
    //
    //   test('should calculate subtraction double term and returns a correct value',
    //       () async {
    //     String result = await sut(params: '2-3-8');
    //     expect(result, '-9');
    //
    //     result = await sut(params: '3-1-0');
    //     expect(result, '2');
    //   });
    //
    //   test('should sum -1 + -1 and returns -4 value', () {
    //     final sut = AdditionUseCase();
    //     final result = sut(a: -2, b: -2);
    //     expect(result, -4);
    //   });
  });
}
