abstract class LocalPreferences {
  Future saveAuthToken(String token);

  Future<String> getAuthToken();

  Future<void> clearData();
}