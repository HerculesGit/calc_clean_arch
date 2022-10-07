import 'package:calc_clean_arch/domain/repositories/history_repository.dart';
import 'package:calc_clean_arch/domain/usecases/calculate_arithmetic_operation_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/convert_string_to_arithmetic_operations_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/get_histories_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/ignore_new_zero_usecase.dart';
import 'package:calc_clean_arch/domain/usecases/save_history_usecase.dart';
import 'package:calc_clean_arch/presentation/controllers/basic_calculator_controller.dart';
import 'package:calc_clean_arch/presentation/services/basic_calculator_service.dart';
import 'package:calc_clean_arch/presentation/view_models/keyboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HistoryRepositorySpy extends Mock implements HistoryRepository {}

void main() {
  late BasicCalculatorController sut;
  late Color lightColor;
  late Color darkColor;

  late KeyboardViewModel acKeyboard;

  setUp(() {
    sut = BasicCalculatorController(BasicCalculatorService(
        CalculateArithmeticOperationUseCase(),
        ConvertStringToArithmeticOperationsUseCase(),
        IgnoreNewZeroUseCase(),
        SaveHistoryUseCase(HistoryRepositorySpy()),
        GetHistoriesUseCase(HistoryRepositorySpy())));

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
    await sut.didKeyPressed(acKeyboard);
    expect(sut.result, '0');
    expect(sut.inputTerm, '');
  });

  test('should replace the first 0 to another digit', () async {
    final keyboardZero = KeyboardViewModel(
        key: '0', lightColor: lightColor, darkColor: darkColor);
    await sut.didKeyPressed(keyboardZero);

    final keyboard1 = KeyboardViewModel(
        key: '1', lightColor: lightColor, darkColor: darkColor);

    await sut.didKeyPressed(keyboard1);

    expect(sut.result, '1');
    expect(sut.inputTerm, '1');

    await sut.didKeyPressed(acKeyboard);

    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardZero);

    await sut.didKeyPressed(keyboardZero);

    await sut.didKeyPressed(keyboard1);

    expect(sut.result, '1');
    expect(sut.inputTerm, '1');
  });

  test('should display one 0 digit when many 0 have been tapped', () async {
    final keyboardZero = KeyboardViewModel(
        key: '0', lightColor: lightColor, darkColor: darkColor);
    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardZero);

    expect(sut.result, '0');
    expect(sut.inputTerm, '0');
  });

  test('should replace the last zero to new number in term 0+0', () async {
    final keyboardZero = KeyboardViewModel(
        key: '0', lightColor: lightColor, darkColor: darkColor);
    final keyboardOne = KeyboardViewModel(
        key: '1', lightColor: lightColor, darkColor: darkColor);
    final keyboardPlus = KeyboardViewModel(
        key: '+', lightColor: lightColor, darkColor: darkColor);

    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardPlus);

    await sut.didKeyPressed(keyboardZero);

    await sut.didKeyPressed(keyboardOne);

    expect(sut.inputTerm, '0+1');

    await sut.didKeyPressed(acKeyboard);
    expect(sut.inputTerm, '');

    ///
    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardPlus);

    await sut.didKeyPressed(keyboardZero);

    await sut.didKeyPressed(keyboardOne);
    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardZero);
    expect(sut.inputTerm, '0+100');

    await sut.didKeyPressed(keyboardOne);
    expect(sut.inputTerm, '0+1001');

    await sut.didKeyPressed(acKeyboard);
    expect(sut.inputTerm, '');

    ///
    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardPlus);
    await sut.didKeyPressed(keyboardOne);
    await sut.didKeyPressed(keyboardZero);

    await sut.didKeyPressed(keyboardPlus);
    await sut.didKeyPressed(keyboardZero);
    await sut.didKeyPressed(keyboardZero);
    expect(sut.inputTerm, '0+10+0');
  });
}
