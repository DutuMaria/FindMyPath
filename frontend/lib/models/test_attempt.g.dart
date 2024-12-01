// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestAttemptImpl _$$TestAttemptImplFromJson(Map<String, dynamic> json) =>
    _$TestAttemptImpl(
      testAttemptId: (json['test_attempt_id'] as num).toInt(),
      attemptDate: DateTime.parse(json['attempt_date'] as String),
      experienceRating: (json['experience_rating'] as num?)?.toInt(),
      isCompleted: json['is_completed'] as bool,
      testRating: (json['test_rating'] as num?)?.toInt(),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$$TestAttemptImplToJson(_$TestAttemptImpl instance) =>
    <String, dynamic>{
      'test_attempt_id': instance.testAttemptId,
      'attempt_date': instance.attemptDate.toIso8601String(),
      'experience_rating': instance.experienceRating,
      'is_completed': instance.isCompleted,
      'test_rating': instance.testRating,
      'user_id': instance.userId,
    };
