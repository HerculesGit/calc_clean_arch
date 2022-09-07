// class OperationParams {
//   final int left;
//   final int right;
//
//   String? result;
//
//   OperationParams({required this.left, required this.right});
// }

// class HistoryScheme {
//   final String text;
//
//   HistoryScheme(this.text);
//
//   factory HistoryScheme.fromJson(Map json) => HistoryScheme(json['text']);
//
//   Map toJson(Map json) => {'text': text};
// }

import '../entity/history.dart';

abstract class HistoryRepository {
  Future<void>? saveHistoryOperation(HistoryEntity history);

  Future<List<HistoryEntity>>? getHistories();
}
