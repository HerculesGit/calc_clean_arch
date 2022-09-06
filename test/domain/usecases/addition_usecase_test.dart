import 'package:flutter_test/flutter_test.dart';

class AdditionUseCase {
  int call({required int a, required int b}) => a + b;
}

void main() {
  group('Addition use case', () {
    test('should sum a + b and returns a positive value', () {
      final sut = AdditionUseCase();
      final result = sut.call(a: 1, b: 2);
      expect(result, 3);
    });

    test('should sum a + -b and returns a negative value', () {
      final sut = AdditionUseCase();
      final result = sut.call(a: 1, b: -2);
      expect(result, -1);
    });

    test('should sum 0 + 0 and returns 0 value', () {
      final sut = AdditionUseCase();
      final result = sut.call(a: 0, b: 0);
      expect(result, 0);
    });

    test('should sum -1 + -1 and returns -4 value', () {
      final sut = AdditionUseCase();
      final result = sut.call(a: -2, b: -2);
      expect(result, -4);
    });
  });
}
