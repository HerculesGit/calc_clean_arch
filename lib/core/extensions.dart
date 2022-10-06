import 'package:calc_clean_arch/domain/enums/arithmetic_symbol.dart';

extension BoolParsing on String {
  bool parseBool() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }

    throw '"$this" can not be parsed to boolean.';
  }
}

extension IsASymbol on String {
  bool isASymbol() {
    if (isEmpty) return false;
    final String value = toLowerCase();
    int index =
        ArithmeticSymbol.values.indexWhere((symbol) => symbol.label == value);
    return (index >= 0);
  }
}

extension IsNumeric on String {
  bool isNumeric() {
    return int.tryParse(this) != null || double.tryParse(this) != null;
  }
}
