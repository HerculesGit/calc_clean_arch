import 'package:calc_clean_arch/domain/entity/history.dart';
import 'package:calc_clean_arch/domain/repositories/history_repository.dart';
import 'package:calc_clean_arch/domain/usecases/save_history_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HistoryRepositorySpy extends Mock implements HistoryRepository {}

void main() {
  group('SaveHistory use case', () {
    test('should call save history repository with correct', () async {
      final historyRepositorySpy = HistoryRepositorySpy();
      final historyEntity = HistoryEntity('asd');
      final sut = SaveHistoryUseCase(historyRepositorySpy);
      await sut(params: historyEntity);

      verify(historyRepositorySpy.saveHistoryOperation(historyEntity))
          .called(1);
    });
  });
}
