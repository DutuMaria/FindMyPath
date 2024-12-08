// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      answerId: (json['answerId'] as num).toInt(),
      answerText: json['answerText'] as String,
      questionId: (json['question_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'answerId': instance.answerId,
      'answerText': instance.answerText,
      'question_id': instance.questionId,
    };
