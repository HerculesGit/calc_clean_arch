import 'package:flutter_test/flutter_test.dart';

class SubtractionUseCase {
  int call({required int a, required int b}) => a - b;
}

void main() {
  group('Addition use case', () {
    test('when a is less than b, should sub a - b and returns a negative value',
        () {
      final sut = SubtractionUseCase();
      final result = sut.call(a: 2, b: 4);
      expect(result, -2);
    });

    test('when a is more than b, should sub a - b and returns a positive value',
        () {
      final sut = SubtractionUseCase();
      final result = sut.call(a: 4, b: 2);
      expect(result, 2);
    });

    test('should sub (-a) - (-b) when a and b is equals and returns 0 value',
        () {
      final sut = SubtractionUseCase();
      final result = sut.call(a: -2, b: -2);
      expect(result, 0);
    });

    test(
        'should sub (-a) - (-b) when a is more than b and returns negative value',
        () {
      final sut = SubtractionUseCase();
      final result = sut.call(a: -5, b: -2);
      expect(result, -3);
    });

    test('should addition (-a) - (b) and returns negative value', () {
      final sut = SubtractionUseCase();
      final result = sut.call(a: -5, b: 2);
      expect(result, -7);
    });

    test('should addition a - b when number is large', () {
      final sut = SubtractionUseCase();
      final result = sut.call(a: 5, b: 2000000000000000000);
      expect(result, -1999999999999999995);
    });
  });
}
