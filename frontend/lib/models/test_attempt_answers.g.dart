// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_attempt_answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestAttemptAnswersImpl _$$TestAttemptAnswersImplFromJson(
        Map<String, dynamic> json) =>
    _$TestAttemptAnswersImpl(
      testAttemptId: (json['test_attempt_id'] as num).toInt(),
      answerId: (json['answer_id'] as num).toInt(),
    );

Map<String, dynamic> _$$TestAttemptAnswersImplToJson(
        _$TestAttemptAnswersImpl instance) =>
    <String, dynamic>{
      'test_attempt_id': instance.testAttemptId,
      'answer_id': instance.answerId,
    };
