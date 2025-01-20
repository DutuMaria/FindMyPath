abstract class LocalPreferences {
  Future saveAuthToken(String token);
  Future saveUserId(String userId);

  Future<String> getAuthToken();
  Future<String> getUserId();

  Future<void> clearData();

  Future<void> saveUserAnswers(Map<int, int> userAnswers);

  Future<Map<int, int>> getUserAnswers();

  Future<void> clearUserAnswers();

  Future saveQuestions(String token);
  Future<String> getQuestions();
  Future<void> clearQuestions();

  Future saveUserInfo(String token);
  Future<String> getUserInfo();
  Future<void> clearUserInfo();

  Future saveUserTests(String token);
  Future<String> getUserTests();
  Future<void> clearUserTests();

  Future saveRatingsSummary(String token);
  Future<String> getRatingsSummary();
  Future<void> clearRatingsSummary();

  Future saveTestResults(String token);
  Future<String> getTestResults();
  Future<void> clearTestResults();
}
