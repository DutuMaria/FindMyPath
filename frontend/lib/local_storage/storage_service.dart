abstract class LocalPreferences {
  Future saveAuthToken(String token);
  Future saveUserId(String userId);

  Future<String> getAuthToken();
  Future<String> getUserId();

  Future<void> clearData();

  Future<void> saveUserAnswers(Map<int, int> userAnswers);

  Future<Map<int, int>> getUserAnswers();

  Future<void> clearUserAnswers();
}
