import 'package:calc_clean_arch/domain/entity/history.dart';
import 'package:flutter/material.dart';

import '../services/basic_calculator_service.dart';

class BasicHistoryCalculatorController extends ChangeNotifier {
  final BasicCalculatorService _service;

  BasicHistoryCalculatorController(this._service);

  bool isFirstLoad = true;

  final List<HistoryEntity> histories = [];

  Future<void> loadHistoryData() async {
    if (isFirstLoad) {
      histories.addAll(await _service.getHistories());
      notifyListeners();
    }

    isFirstLoad = false;
  }

  void initData() {
    histories.clear();
    isFirstLoad = true;
  }
}
