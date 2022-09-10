abstract class LocalStorage {
  Future<void>? put(final String key, final String value);

  Future<String?>? get(final String key, {String? defaultValue});

  Future<void> remove(final String key);
}
