import 'package:calc_clean_arch/domain/enums/arithmetic_symbol.dart';
import 'package:flutter/material.dart';

import '../services/basic_calculator_service.dart';

class BasicCalculatorController extends ChangeNotifier {
  final BasicCalculatorService _service;

  BasicCalculatorController(this._service);

  String result = '';
  String inputTerm = '';

  changeTerms(final String newCharacter) {
    _normalizeInputTerm(newCharacter);

    int lastIndex = ArithmeticSymbol.values
        .lastIndexWhere((symbol) => newCharacter == symbol.label);
    if (lastIndex == -1) {
      _automaticCalculate(newCharacter);
    }
  }

  Future<void> _automaticCalculate(final String newCharacter) async {
    result = await _service.calculate(inputTerm);
    notifyListeners();
  }

  _normalizeInputTerm(final String character) {
    _addZeroDigitIfTermIsEmpty(character);
    _removeLastArithmeticSymbol(character);

    inputTerm += character;
    notifyListeners();
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

  _addZeroDigitIfTermIsEmpty(final String character) {
    final firstIndex = ArithmeticSymbol.values
        .indexWhere((symbol) => symbol.label == character);
    final bool firstCharacterIsASymbol = firstIndex >= 0;
    if (inputTerm.isEmpty && firstCharacterIsASymbol) inputTerm += '0';
  }
}
