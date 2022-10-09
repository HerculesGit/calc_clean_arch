import 'package:calc_clean_arch/domain/usecases/usecase.dart';

import '../enums/arithmetic_symbol.dart';
import 'addition_use_case.dart';
import 'multiplication_use_case.dart';
import 'subtraction_use_case.dart';

class FoundedSymbol {
  final int index;
  final ArithmeticSymbol arithmeticSymbol;

  FoundedSymbol({required this.index, required this.arithmeticSymbol});
}

class CalculateArithmeticOperationUseCase
    implements UseCase<List<String>, String> {
  late List<String> arithmeticOperations;

  @override
  Future<String> call({required List<String> params}) async {
    arithmeticOperations = params;

    return calcArithmeticOperations();
  }

  String calcArithmeticOperations() {
    if (arithmeticOperations.isEmpty) return '0';

    int index = searchSymbol(ArithmeticSymbol.product);
    if (index >= 0) {
      calcValuesFromSymbol(
          symbolIndex: index, arithmeticSymbol: ArithmeticSymbol.product);
      calcArithmeticOperations();
    }

    final foundedSymbol = _searchFirstAnySymbol();
    if (foundedSymbol != null) {
      calcValuesFromSymbol(
          symbolIndex: foundedSymbol.index,
          arithmeticSymbol: foundedSymbol.arithmeticSymbol);
      calcArithmeticOperations();
    }
    return arithmeticOperations.first;
  }

  void calcValuesFromSymbol(
      {required int symbolIndex, required ArithmeticSymbol arithmeticSymbol}) {
    const String markToRemove = '@';
    final start = symbolIndex - 1;
    final end = symbolIndex + 1;

    final int numberA =
        int.parse(_getNumberBeforeOperatorSymbol(symbolIndex: symbolIndex));

    final int numberB =
        int.parse(_getNumberAfterOperatorSymbol(symbolIndex: symbolIndex));

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
    arithmeticOperations[symbolIndex] = result.toString();
    arithmeticOperations[start] = markToRemove;
    arithmeticOperations[end] = markToRemove;

    arithmeticOperations.removeWhere((val) => val == markToRemove);
  }

  int searchSymbol(ArithmeticSymbol arithmeticSymbol) =>
      arithmeticOperations.indexOf(arithmeticSymbol.label);

  FoundedSymbol? _searchFirstAnySymbol() {
    for (int characterPosition = 0;
        arithmeticOperations.length > characterPosition;
        characterPosition++) {
      for (var symbol in ArithmeticSymbol.values) {
        if (arithmeticOperations[characterPosition] == symbol.label) {
          return FoundedSymbol(
              index: characterPosition, arithmeticSymbol: symbol);
        }
      }
    }
    return null;
  }

  /// e.g [[1,x,2,+,3]] <br>
  /// [symbolIndex] = 1<br>
  /// returns = 1
  String _getNumberBeforeOperatorSymbol({required int symbolIndex}) {
    return arithmeticOperations.elementAt(symbolIndex - 1);
  }

  String _getNumberAfterOperatorSymbol({required int symbolIndex}) {
    return arithmeticOperations.elementAt(symbolIndex + 1);
  }
}
