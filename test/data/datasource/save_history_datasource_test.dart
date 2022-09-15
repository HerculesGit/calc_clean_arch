import 'package:calc_clean_arch/data/datasource/local/local_storage.dart';
import 'package:calc_clean_arch/data/repositories/history_repository.dart';
import 'package:calc_clean_arch/domain/entity/history.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LocalStorageSpy extends Mock implements LocalStorage {}

class LocalStorageMocked implements LocalStorage {
  Map<String, String> dbStorage = {};

  @override
  Future<String?>? get(String key, {String? defaultValue}) async {
    return dbStorage[key];
  }

  @override
  Future<void>? put(String key, String value) async {
    dbStorage[key] = value;
  }

  @override
  Future<void> remove(String key) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}

void main() {
  late HistoryRepositoryDataSource sut;
  setUp(() {
    sut = HistoryRepositoryDataSource(LocalStorageSpy());
  });

  test('should save history on localStorage', () async {
    sut = HistoryRepositoryDataSource(LocalStorageMocked());

    const String term = '2x3+1';
    final history = HistoryEntity(term);
    await sut.saveHistoryOperation(history);
    List<HistoryEntity>? lastHistories = await sut.getHistories();
    if (lastHistories == null) {
      expect(lastHistories, []);
      return;
    }
    expect(lastHistories.first.value, history.value);
  });

  test('should save multiples history on localStorage', () async {
    sut = HistoryRepositoryDataSource(LocalStorageMocked());
    final List<HistoryEntity> histories = [];
    const historyLength = 20;
    List.generate(
        historyLength, (index) => histories.add(HistoryEntity('2x3+$index')));

    for (var history in histories) {
      await sut.saveHistoryOperation(history);
    }

    List<HistoryEntity>? lastHistories = await sut.getHistories();
    if (lastHistories == null) {
      expect(lastHistories, []);
      return;
    }
    expect(histories.length, historyLength);
    expect(lastHistories.length, historyLength);

    for (var history in histories) {
      final indexOf = histories.indexOf(history);
      expect(history.value, lastHistories[indexOf].value);
    }
  });
}
