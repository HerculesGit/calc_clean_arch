import '../entity/history.dart';

abstract class HistoryRepository {
  Future<void>? saveHistoryOperation(HistoryEntity history);

  Future<List<HistoryEntity>>? getHistories();
}
