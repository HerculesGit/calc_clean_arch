import '../enums/arithmetic_symbol.dart';
import 'usecase.dart';

class ConvertStringToArithmeticOperationsUseCase
    implements UseCase<String, List<String>> {
  @override
  Future<List<String>> call({required String params}) async =>
      _convertStringTermsInList(params);

  List<String> _convertStringTermsInList(final String params) {
    final List<String> terms = [];

    String newTerm = '';
    for (int index = 0; index < params.length; index++) {
      String term = params[index];

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
}
