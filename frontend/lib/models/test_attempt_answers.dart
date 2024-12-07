import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_attempt_answers.freezed.dart';
part 'test_attempt_answers.g.dart';

@freezed
class TestAttemptAnswers with _$TestAttemptAnswers {
  factory TestAttemptAnswers({
    @JsonKey(name: 'test_attempt_id') required int testAttemptId,
    @JsonKey(name: 'answer_id') required int answerId,
  }) = _TestAttemptAnswers;

  factory TestAttemptAnswers.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptAnswersFromJson(json);
}
