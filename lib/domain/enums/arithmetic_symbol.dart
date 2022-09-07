enum ArithmeticSymbol {
  /// x + y
  sum,

  /// x - y
  difference,

  /// x * y
  product,

  /// x / y
  fraction,
}

extension SymbolPriorityExtension on ArithmeticSymbol {
  int get priority {
    switch (this) {
      case ArithmeticSymbol.sum:
      case ArithmeticSymbol.difference:
        return 0;
      case ArithmeticSymbol.product:
      case ArithmeticSymbol.fraction:
        return 1;
      default:
        return 0;
    }
  }

  String get label {
    switch (this) {
      case ArithmeticSymbol.sum:
        return '+';
      case ArithmeticSymbol.difference:
        return '-';
      case ArithmeticSymbol.product:
        return "x";
      case ArithmeticSymbol.fraction:
        return '/';
      default:
        return '';
    }
  }
}
