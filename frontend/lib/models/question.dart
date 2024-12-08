import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/models/answer.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    @JsonKey(name: 'questionId') required int questionId,
    @JsonKey(name: 'questionText') required String questionText,
    @JsonKey(name: 'answerList') List<Answer>? answers,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
