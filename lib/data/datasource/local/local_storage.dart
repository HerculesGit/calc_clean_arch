abstract class LocalStorage {
  Future<void>? put(final String key, dynamic value);

  Future? get(final String key, {dynamic initialValue});

  Future<void>? remove(final String key);
}
