import 'package:calc_clean_arch/domain/usecases/ignore_new_zero_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Ignore zero UseCase', () {
    test('should ignore the 0 when oldTerm is 0', () {
      final sut = IgnoreNewZeroUseCase();
      Term term = Term(oldTerm: '0', newKeyPressed: '0');
      expect(sut(params: term), true);
    });

    test('should\'nt ignore the 0 when oldTerm is 0+', () {
      final sut = IgnoreNewZeroUseCase();
      Term term = Term(oldTerm: '0+', newKeyPressed: '0');
      expect(sut(params: term), false);
    });

    test('should ignore zero when oldTerm is 0+0', () {
      final sut = IgnoreNewZeroUseCase();
      Term term = Term(oldTerm: '1+0', newKeyPressed: '0');
      expect(sut(params: term), true);
    });

    test('should\'nt ignore zero when oldTerm finish with any symbol', () {
      final sut = IgnoreNewZeroUseCase();
      Term term = Term(oldTerm: '1+0+', newKeyPressed: '0');
      expect(sut(params: term), false);
    });

    test('should\'nt ignore zero when oldTerm is 0+0-', () {
      final sut = IgnoreNewZeroUseCase();
      Term term = Term(oldTerm: '0+0', newKeyPressed: '0');
      expect(sut(params: term), true);
    });
  });
}
