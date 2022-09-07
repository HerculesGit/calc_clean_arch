import 'package:calc_clean_arch/domain/usecases/usecase.dart';

import '../enums/arithmetic_symbol.dart';
import 'addition_use_case.dart';
import 'multiplication_use_case.dart';
import 'subtraction_use_case.dart';

class CalculateArithmeticOperationUseCase
    implements UseCase<List<String>, String> {
  late List<String> arithmeticOperations;

  @override
  Future<String> call({required List<String> params}) async {
    arithmeticOperations = params;

    return calcArithmeticOperations(params);
  }

  String calcArithmeticOperations(List<String> array) {
    if (array.isEmpty) return '0';

    int index = searchSymbol(ArithmeticSymbol.product, array);
    if (index >= 0) {
      array = calcValuesFromSymbol(
          symbolIndex: index,
          arithmeticSymbol: ArithmeticSymbol.product,
          array: array);
      calcArithmeticOperations(array);
    }

    index = searchSymbol(ArithmeticSymbol.sum, array);
    if (index >= 0) {
      array = calcValuesFromSymbol(
          symbolIndex: index,
          arithmeticSymbol: ArithmeticSymbol.sum,
          array: array);
      calcArithmeticOperations(array);
    }

    index = searchSymbol(ArithmeticSymbol.difference, array);
    if (index >= 0) {
      array = calcValuesFromSymbol(
          symbolIndex: index,
          arithmeticSymbol: ArithmeticSymbol.difference,
          array: array);
      calcArithmeticOperations(array);
    }

    return array.first;
  }

  List<String> calcValuesFromSymbol(
      {required int symbolIndex,
      required ArithmeticSymbol arithmeticSymbol,
      required List<String> array}) {
    const String markToRemove = '@';
    final start = symbolIndex - 1;
    final end = symbolIndex + 1;

    final int numberA = int.parse(_getNumberBeforeOperatorSymbol(
        symbolIndex: symbolIndex, list: array));

    final int numberB = int.parse(_getNumberAfterOperatorSymbol(
        symbolIndex: symbolIndex, list: array));

    int result = 0;
    switch (arithmeticSymbol) {
      case ArithmeticSymbol.sum:
        result = AdditionUseCase()(a: numberA, b: numberB);
        break;
      case ArithmeticSymbol.difference:
        result = SubtractionUseCase()(a: numberA, b: numberB);
        break;
      case ArithmeticSymbol.product:
        result = MultiplicationUseCase()(a: numberA, b: numberB);
        break;
      default:
        result = 0;
    }
    array[symbolIndex] = result.toString();
    array[start] = markToRemove;
    array[end] = markToRemove;

    array.removeWhere((val) => val == markToRemove);
    return array;
  }

  int searchSymbol(ArithmeticSymbol arithmeticSymbol, List<String> array) =>
      array.indexOf(arithmeticSymbol.label);

  /// e.g [[1,x,2,+,3]] <br>
  /// [symbolIndex] = 1<br>
  /// returns = 1
  String _getNumberBeforeOperatorSymbol(
      {required int symbolIndex, required List<String> list}) {
    return list.elementAt(symbolIndex - 1);
  }

  String _getNumberAfterOperatorSymbol(
      {required int symbolIndex, required List<String> list}) {
    return list.elementAt(symbolIndex + 1);
  }
}
