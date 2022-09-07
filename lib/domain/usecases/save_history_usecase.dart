import 'package:calc_clean_arch/domain/repositories/history_repository.dart';

import '../entity/history.dart';
import 'usecase.dart';

class SaveHistoryUseCase implements UseCase<HistoryEntity, void> {
  final HistoryRepository _historyRepository;

  SaveHistoryUseCase(this._historyRepository);

  @override
  Future<void> call({required HistoryEntity params}) async {
    await _historyRepository.saveHistoryOperation(params);
  }
}
