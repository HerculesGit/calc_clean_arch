import 'package:calc_clean_arch/domain/enums/arithmetic_symbol.dart';
import 'package:calc_clean_arch/presentation/view_models/view_models.dart';
import 'package:flutter/material.dart';

import '../services/basic_calculator_service.dart';

class BasicCalculatorController extends ChangeNotifier {
  final BasicCalculatorService _service;

  bool historyWasSaved = false;
  bool animateResult = true;

  BasicCalculatorController(this._service) {
    _clearDisplay();
  }

  String result = '';
  String inputTerm = '';

  Future didKeyPressed(final KeyboardViewModel keyTapped) async {
    if (clearIsButtonPressed(keyTapped)) {
      _clearDisplay();
      return;
    }

    if (equalsButtonIsPressed(keyTapped)) {
      didEqualsPressed();
      return;
    }

    if (historyWasSaved) _clearDisplay();

    String newCharacter = keyTapped.key;
    _normalizeInputTerm(keyTapped);

    if (_service.ignoreZero(oldTerm: inputTerm, keyPressed: keyTapped.key)) {
      return;
    }

    int lastIndex = ArithmeticSymbol.values
        .lastIndexWhere((symbol) => newCharacter == symbol.label);
    if (lastIndex == -1) {
      await _automaticCalculate(newCharacter);
    }
    animateResult = false;
    historyWasSaved = false;
  }

  bool clearIsButtonPressed(final KeyboardViewModel keyTapped) =>
      keyTapped.isClearButton;

  bool equalsButtonIsPressed(final KeyboardViewModel keyTapped) =>
      keyTapped.key == '=';

  Future<void> didEqualsPressed() async {
    if (!historyWasSaved) {
      _service.saveHistory('$inputTerm\n=$result');
      animateResult = true;
      notifyListeners();
    }
    historyWasSaved = true;
  }

  void _clearDisplay() {
    result = '0';
    inputTerm = '';
    historyWasSaved = false;
    animateResult = true;
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
    _replaceLastZeroToNewNumber(keyTapped);

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

  _replaceLastZeroToNewNumber(final KeyboardViewModel keyTapped) {
    if (inputTerm.endsWith('0') &&
        inputTerm.length > 2 &&
        keyTapped.isANumber) {
      int lastSymbolPosition = _getLastSymbolPosition();
      if (lastSymbolPosition >= 0 &&
          inputTerm.characters.elementAt(lastSymbolPosition + 1) == '0') {
        inputTerm = inputTerm.substring(0, inputTerm.length - 1);
      }
    }
  }

  int _getLastSymbolPosition() {
    int position = inputTerm.characters.toList().lastIndexWhere((character) {
      int index = ArithmeticSymbol.values
          .lastIndexWhere((symbol) => symbol.label == character);

      if (index >= 0) return true;

      return false;
    });

    return position;
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
