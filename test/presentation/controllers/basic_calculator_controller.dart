import 'package:calc_clean_arch/domain/usecases/calculate_arithmetic_operation_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/convert_string_to_arithmetic_operations_usecase.dart';
import 'package:calc_clean_arch/presentation/controllers/basic_calculator_controller.dart';
import 'package:calc_clean_arch/presentation/services/basic_calculator_service.dart';
import 'package:calc_clean_arch/presentation/view_models/view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BasicCalculatorController sut;
  late Color lightColor;
  late Color darkColor;

  late KeyboardViewModel acKeyboard;

  setUp(() {
    sut = BasicCalculatorController(BasicCalculatorService(
        CalculateArithmeticOperationUseCase(),
        ConvertStringToArithmeticOperationsUseCase()));

    lightColor = Colors.orange;
    darkColor = Colors.red;

    acKeyboard = KeyboardViewModel(
        key: 'AC',
        lightColor: Colors.orange,
        darkColor: Colors.red,
        isClearButton: true);
  });

  test('should initialize result like as zero', () {
    expect(sut.result, '0');
    expect(sut.inputTerm, '');
  });

  test(
      'should set result as zero and inputTerm as blank string when AC as passed to controller',
      () async {
    expect(acKeyboard.key, 'AC');
    expect(acKeyboard.isClearButton, true);
    await sut.changeTerms(acKeyboard);
    expect(sut.result, '0');
    expect(sut.inputTerm, '');
  });

  test('should replace the first 0 to another digit', () async {
    final keyboardZero = KeyboardViewModel(
        key: '0', lightColor: lightColor, darkColor: darkColor);
    await sut.changeTerms(keyboardZero);

    final keyboard1 = KeyboardViewModel(
        key: '1', lightColor: lightColor, darkColor: darkColor);

    await sut.changeTerms(keyboard1);

    expect(sut.result, '1');
    expect(sut.inputTerm, '1');

    await sut.changeTerms(acKeyboard);

    await sut.changeTerms(keyboardZero);
    await sut.changeTerms(keyboardZero);
    await sut.changeTerms(keyboardZero);

    await sut.changeTerms(keyboardZero);

    await sut.changeTerms(keyboard1);

    expect(sut.result, '1');
    expect(sut.inputTerm, '1');
  });

  test('should display one 0 digit when many 0 have been tapped', () async {
    final keyboardZero = KeyboardViewModel(
        key: '0', lightColor: lightColor, darkColor: darkColor);
    await sut.changeTerms(keyboardZero);
    await sut.changeTerms(keyboardZero);
    await sut.changeTerms(keyboardZero);
    await sut.changeTerms(keyboardZero);

    expect(sut.result, '0');
    expect(sut.inputTerm, '0');
  });
}
