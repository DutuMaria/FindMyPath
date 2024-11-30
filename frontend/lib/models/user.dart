// models.dart
class User {
  final int userId;
  final String email;

  User({required this.userId, required this.email});
}

class TestAttempt {
  final int testAttemptId;
  final int userId;

  TestAttempt({required this.testAttemptId, required this.userId});
}

class TestAttemptAnswers {
  final int testAttemptId;
  final int answerId;

  TestAttemptAnswers({
    required this.testAttemptId,
    required this.answerId,
  });
}
