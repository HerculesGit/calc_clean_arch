class HistoryEntity {
  final String value;

  HistoryEntity(this.value);

  factory HistoryEntity.fromJson(final Map json) {
    return HistoryEntity(json['value']);
  }

  Map toJson() => {'value': value};
}
