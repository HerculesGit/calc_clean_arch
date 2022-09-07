import '../enums/arithmetic_symbol.dart';
import 'addition_use_case.dart';
import 'multiplication_use_case.dart';
import 'subtraction_use_case.dart';
import 'usecase.dart';

class ExtractStringToArithmeticOperationsUseCase
    implements UseCase<String, String> {
  @override
  Future<String> call({required String params}) async {
    return extractInArithmeticOperations(convertStringTermsInList(params));
  }

  String extractInArithmeticOperations(List<String> array) {
    if (array.isEmpty) return '0';

    int index = searchToProduct(array);
    if (index >= 0) {
      array = calcValuesFromSymbol(
          symbolIndex: index,
          arithmeticSymbol: ArithmeticSymbol.product,
          array: array);
      extractInArithmeticOperations(array);
    }

    index = searchToSum(array);
    if (index >= 0) {
      array = calcValuesFromSymbol(
          symbolIndex: index,
          arithmeticSymbol: ArithmeticSymbol.sum,
          array: array);
      extractInArithmeticOperations(array);
    }

    index = searchToDifference(array);
    if (index >= 0) {
      array = calcValuesFromSymbol(
          symbolIndex: index,
          arithmeticSymbol: ArithmeticSymbol.difference,
          array: array);
      extractInArithmeticOperations(array);
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

    final int numberA = int.parse(_getLeftNumberBetweenOperatorSymbol(
        symbolIndex: symbolIndex, list: array));

    final int numberB = int.parse(_getRightNumberBetweenOperatorSymbol(
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

  int searchToProduct(List<String> array) {
    for (int index = 0; index < array.length; index++) {
      String letter = array[index];
      if (letter == 'x') {
        return index;
      }
    }

    return -1;
  }

  int searchToSum(List<String> array) {
    for (int index = 0; index < array.length; index++) {
      String letter = array[index];
      if (letter == '+') {
        return index;
      }
    }

    return -1;
  }

  int searchToDifference(List<String> array) {
    for (int index = 0; index < array.length; index++) {
      String letter = array[index];
      if (letter == '-') {
        return index;
      }
    }

    return -1;
  }

  List<String> convertStringTermsInList(final String arithmeticOperations) {
    final List<String> terms = [];

    String newTerm = '';
    for (int index = 0; index < arithmeticOperations.length; index++) {
      String term = arithmeticOperations[index];

      int position =
          ArithmeticSymbol.values.indexWhere((symbol) => symbol.label == term);

      /// if there is not a symbol
      if (position == -1) {
        newTerm = '$newTerm$term';
      } else {
        terms.add(newTerm);
        terms.add(term);
        newTerm = '';
      }
    }
    terms.add(newTerm);

    return terms;
  }

  /// e.g [[1,x,2,+,3]] <br>
  /// [symbolIndex] = 1<br>
  /// returns = 1
  String _getLeftNumberBetweenOperatorSymbol(
      {required int symbolIndex, required List<String> list}) {
    return list.elementAt(symbolIndex - 1);
  }

  String _getRightNumberBetweenOperatorSymbol(
      {required int symbolIndex, required List<String> list}) {
    return list.elementAt(symbolIndex + 1);
  }
}
