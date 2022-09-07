import 'package:calc_clean_arch/domain/entity/history.dart';
import 'package:calc_clean_arch/domain/repositories/history_repository.dart';
import 'package:calc_clean_arch/domain/usecases/get_histories_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HistoryRepositorySpy extends Mock implements HistoryRepository {}

void main() {
  group('GetHistories use case', () {
    test('should call getHistories and returns a list of the Historic',
        () async {
      final historyRepositorySpy = HistoryRepositorySpy();
      String text = faker.randomGenerator.string(2);

      final historyEntity = HistoryEntity(text);
      final sut = GetHistoriesUseCase(historyRepositorySpy);
      await sut(params: historyEntity);

      verify(historyRepositorySpy.getHistories()).called(1);
      verifyNoMoreInteractions(historyRepositorySpy);
    });
  });
}
