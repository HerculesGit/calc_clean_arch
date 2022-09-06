import 'package:flutter_test/flutter_test.dart';

class MultiplicationUseCase {
  int call({required int a, required int b}) => a * b;
}

void main() {
  group('Addition use case', () {
    test('should multiply a * b and returns a positive value', () {
      final sut = MultiplicationUseCase();
      int result = sut.call(a: 2, b: 2);
      expect(result, 4);

      result = sut.call(a: 4, b: 4);
      expect(result, 16);
    });

    test('should multiply a * -b and returns a negative value', () {
      final sut = MultiplicationUseCase();
      int result = sut.call(a: 2, b: -2);
      expect(result, -4);

      result = sut.call(a: -2, b: 2);
      expect(result, -4);
    });

    test('should multiply a * -b and returns a negative value', () {
      final sut = MultiplicationUseCase();
      final result = sut.call(a: 0, b: 0);
      expect(result, 0);
    });

    test('should multiply -a * -b and returns a positive value', () {
      final sut = MultiplicationUseCase();
      final result = sut.call(a: -4, b: -4);
      expect(result, 16);
    });

    test('should multiply 0 with any value and returns 0', () {
      final sut = MultiplicationUseCase();
      int result = sut.call(a: 0, b: 4);
      expect(result, 0);

      result = sut.call(a: 0, b: -4);
      expect(result, 0);

      result = sut.call(a: -0, b: 0);
      expect(result, 0);

      result = sut.call(a: 0, b: -1);
      expect(result, 0);
    });

    test('should multiply 1 with any b value and returns the same b value', () {
      final sut = MultiplicationUseCase();
      int result = sut.call(a: 1, b: 4);
      expect(result, 4);

      result = sut.call(a: -5, b: 1);
      expect(result, -5);

      result = sut.call(a: -1, b: 4);
      expect(result, -4);
    });
  });
}
