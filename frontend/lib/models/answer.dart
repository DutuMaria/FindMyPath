import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  factory Answer({
    @JsonKey(name: 'answer_id') required int answerId,
    @JsonKey(name: 'answer_text') required String answerText,
    @JsonKey(name: 'question_id') required int questionId,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
