class EquationScheme {
  final String term;
  final String result;

  EquationScheme({required this.term, required this.result});

  factory EquationScheme.fromJson(Map json) =>
      EquationScheme(term: json['term'], result: json['result']);
}
