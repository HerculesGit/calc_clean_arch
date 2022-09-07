import 'package:calc_clean_arch/domain/repositories/history_repository.dart';

import '../entity/history.dart';
import 'usecase.dart';

class GetHistoriesUseCase implements UseCase<void, List<HistoryEntity>> {
  final HistoryRepository _historyRepository;

  GetHistoriesUseCase(this._historyRepository);

  @override
  Future<List<HistoryEntity>> call({required void params}) async {
    final histories = await _historyRepository.getHistories();
    return histories ?? [];
  }
}
