abstract class LocalPreferences {
  Future saveAuthToken(String token);

  Future<String> getAuthToken();

  Future<void> clearData();

  Future<void> saveUserAnswers(Map<int, int> userAnswers);

  Future<Map<int, int>> getUserAnswers();

  Future<void> clearUserAnswers();
}
