import 'package:calc_clean_arch/data/schemes/equation_scheme.dart';

abstract class LocalStorage {
  Future<void> saveHistory();

  Future<List<EquationScheme>> getHistory();
}
