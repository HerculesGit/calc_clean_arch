import 'dart:convert';

import 'package:calc_clean_arch/data/datasource/local/local_storage.dart';
import 'package:calc_clean_arch/domain/entity/history.dart';

import '../../domain/repositories/history_repository.dart';

class HistoryRepositoryDataSource implements HistoryRepository {
  final LocalStorage _localStorage;
  final String kKeyHistories = 'history';

  HistoryRepositoryDataSource(this._localStorage);

  @override
  Future<List<HistoryEntity>>? getHistories() async {
    final jsonString = await _localStorage.get(kKeyHistories);
    List<HistoryEntity> list = [];

    if (jsonString == null) return list;
    return (jsonDecode(jsonString) as List)
        .map((json) => HistoryEntity.fromJson(json))
        .toList();
  }

  @override
  Future<void>? saveHistoryOperation(HistoryEntity history) async {
    final lastHistories = await getHistories();
    lastHistories?.add(history);
    final jsonString = jsonEncode(lastHistories);
    _localStorage.put(kKeyHistories, jsonString);
  }
}
