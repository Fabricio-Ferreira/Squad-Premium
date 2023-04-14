abstract class AppLocalStorage {
  Future<bool> save(String key, String value);
  Future<String> get(String key);
  Future<bool> clear();
}
