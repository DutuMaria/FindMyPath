// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      answerId: (json['answer_id'] as num).toInt(),
      answerText: json['answer_text'] as String,
      questionId: (json['question_id'] as num).toInt(),
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'answer_id': instance.answerId,
      'answer_text': instance.answerText,
      'question_id': instance.questionId,
    };
