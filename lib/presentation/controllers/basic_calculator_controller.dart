import 'package:calc_clean_arch/domain/enums/arithmetic_symbol.dart';
import 'package:calc_clean_arch/presentation/view_models/view_models.dart';
import 'package:flutter/material.dart';

import '../services/basic_calculator_service.dart';

class BasicCalculatorController extends ChangeNotifier {
  final BasicCalculatorService _service;

  BasicCalculatorController(this._service) {
    _clearDisplay();
  }

  String result = '';
  String inputTerm = '';

  Future changeTerms(final KeyboardViewModel keyTapped) async {
    if (keyTapped.isClearButton) {
      _clearDisplay();
      return;
    }

    if (inputTerm.startsWith('0') && keyTapped.key == '0') {
      return;
    }

    String newCharacter = keyTapped.key;
    _normalizeInputTerm(keyTapped);

    int lastIndex = ArithmeticSymbol.values
        .lastIndexWhere((symbol) => newCharacter == symbol.label);
    if (lastIndex == -1) {
      await _automaticCalculate(newCharacter);
    }
  }

  void _clearDisplay() {
    result = '0';
    inputTerm = '';
    notifyListeners();
  }

  Future<void> _automaticCalculate(final String newCharacter) async {
    result = await _service.calculate(inputTerm);
    notifyListeners();
  }

  _normalizeInputTerm(final KeyboardViewModel keyTapped) {
    String character = keyTapped.key;
    _addZeroDigitIfFirstCharacterIsAOperator(character);
    _removeLastArithmeticSymbol(character);
    _replaceFirstZeroToAnotherNumber(keyTapped);

    inputTerm += character;
    notifyListeners();
  }

  _replaceFirstZeroToAnotherNumber(final KeyboardViewModel keyTapped) {
    if (inputTerm.startsWith('0') &&
        inputTerm.length == 1 &&
        keyTapped.isANumber) {
      inputTerm = '';
    }
  }

  _removeLastArithmeticSymbol(final String character) {
    if (inputTerm.isEmpty) return;

    final characterIsASymbol = ArithmeticSymbol.values
            .indexWhere((symbol) => character == symbol.label) >=
        0;

    if (characterIsASymbol) {
      for (var symbol in ArithmeticSymbol.values) {
        final endCharacter = inputTerm.characters.last;
        if (endCharacter == symbol.label) {
          inputTerm = inputTerm.substring(0, inputTerm.length - 1);
        }
      }
    }
  }

  _addZeroDigitIfFirstCharacterIsAOperator(final String character) {
    final firstIndex = ArithmeticSymbol.values
        .indexWhere((symbol) => symbol.label == character);
    final bool firstCharacterIsASymbol = firstIndex >= 0;
    if (inputTerm.isEmpty && firstCharacterIsASymbol) inputTerm += '0';
  }
}
