abstract class AppLocalStorage {
  Future<bool> saveData(String key, String value);
  Future<String> getData(String key);
  Future<bool> clear();
}
