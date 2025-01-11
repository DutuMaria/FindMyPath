import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_test.freezed.dart';
part 'user_test.g.dart';

@freezed
class UserTest with _$UserTest {
  factory UserTest({
    @JsonKey(name: 'testAttemptId') required int testAttemptId,
    @JsonKey(name: 'attemptDate') required DateTime attemptDate,
    @JsonKey(name: 'testRating') int? testRating,
    @JsonKey(name: 'experienceRating') int? experienceRating,
    @JsonKey(name: 'isCompleted') required bool isCompleted,
  }) = _UserTest;

  factory UserTest.fromJson(Map<String, dynamic> json) =>
      _$UserTestFromJson(json);
}
