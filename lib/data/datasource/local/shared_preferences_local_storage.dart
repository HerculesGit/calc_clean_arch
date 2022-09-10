import 'package:calc_clean_arch/data/datasource/local/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage implements LocalStorage {
  late SharedPreferences _prefs;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  @override
  Future<String?> get(String key, {String? defaultValue}) async {
    return _prefs.getString(key) ?? defaultValue;
  }

  @override
  Future<void>? put(String key, String value) async {
    _prefs.setString(key, value);
  }

  @override
  Future<void> remove(String key) async {
    _prefs.remove(key);
  }
}
