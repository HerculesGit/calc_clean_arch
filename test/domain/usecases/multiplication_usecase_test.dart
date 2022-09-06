import 'package:calc_clean_arch/domain/usecases/multiplication_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Addition use case', () {
    test('should multiply a * b and returns a positive value', () {
      final sut = MultiplicationUseCase();
      int result = sut(a: 2, b: 2);
      expect(result, 4);

      result = sut(a: 4, b: 4);
      expect(result, 16);
    });

    test('should multiply a * -b and returns a negative value', () {
      final sut = MultiplicationUseCase();
      int result = sut(a: 2, b: -2);
      expect(result, -4);

      result = sut(a: -2, b: 2);
      expect(result, -4);
    });

    test('should multiply a * -b and returns a negative value', () {
      final sut = MultiplicationUseCase();
      final result = sut(a: 0, b: 0);
      expect(result, 0);
    });

    test('should multiply -a * -b and returns a positive value', () {
      final sut = MultiplicationUseCase();
      final result = sut(a: -4, b: -4);
      expect(result, 16);
    });

    test('should multiply 0 with any value and returns 0', () {
      final sut = MultiplicationUseCase();
      int result = sut(a: 0, b: 4);
      expect(result, 0);

      result = sut(a: 0, b: -4);
      expect(result, 0);

      result = sut(a: -0, b: 0);
      expect(result, 0);

      result = sut(a: 0, b: -1);
      expect(result, 0);
    });

    test('should multiply 1 with any b value and returns the same b value', () {
      final sut = MultiplicationUseCase();
      int result = sut(a: 1, b: 4);
      expect(result, 4);

      result = sut(a: -5, b: 1);
      expect(result, -5);

      result = sut(a: -1, b: 4);
      expect(result, -4);
    });
  });
}
