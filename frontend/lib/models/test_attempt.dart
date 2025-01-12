import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_attempt.freezed.dart';
part 'test_attempt.g.dart';

@freezed
class TestAttempt with _$TestAttempt {
  factory TestAttempt({
    @JsonKey(name: 'test_attempt_id') required int testAttemptId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'attempt_date') required DateTime? attemptDate,
    @JsonKey(name: 'test_rating') required int? testRating,
    @JsonKey(name: 'experience_rating') required int? experienceRating,
    @JsonKey(name: 'is_completed') required bool isCompleted,
  }) = _TestAttempt;

  factory TestAttempt.fromJson(Map<String, dynamic> json) =>
      _$TestAttemptFromJson(json);
}
