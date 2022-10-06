import 'package:calc_clean_arch/core/extensions.dart';
import 'package:calc_clean_arch/domain/usecases/simple_use_case.dart';
import 'package:flutter/material.dart';

class Term {
  final String newKeyPressed;
  final String oldTerm;

  Term({required this.oldTerm, required this.newKeyPressed});
}

class IgnoreNewZeroUseCase implements SimpleUseCase<Term, bool> {
  final keyboardZero = '0';

  /// params = terms
  @override
  bool call({required Term params}) {
    if (params.oldTerm.isEmpty || params.newKeyPressed != keyboardZero) {
      return false;
    }
    if (params.oldTerm == keyboardZero) return true;
    if (params.oldTerm.characters.last.isASymbol()) return false;

    /// e.g 0+
    if (params.oldTerm.length == 2 && params.oldTerm.startsWith(keyboardZero)) {
      return false;
    }

    final termsReversed = params.oldTerm.characters.toList();

    int symbolIndex =
        termsReversed.lastIndexWhere((character) => character.isASymbol());

    return (symbolIndex >= 0 && termsReversed[symbolIndex + 1] == keyboardZero);
  }
}
