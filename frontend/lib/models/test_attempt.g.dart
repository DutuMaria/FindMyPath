// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestAttemptImpl _$$TestAttemptImplFromJson(Map<String, dynamic> json) =>
    _$TestAttemptImpl(
      testAttemptId: (json['test_attempt_id'] as num).toInt(),
      userId: json['user_id'] as String,
      attemptDate: json['attempt_date'] == null
          ? null
          : DateTime.parse(json['attempt_date'] as String),
      testRating: (json['test_rating'] as num?)?.toInt(),
      experienceRating: (json['experience_rating'] as num?)?.toInt(),
      isCompleted: json['is_completed'] as bool,
    );

Map<String, dynamic> _$$TestAttemptImplToJson(_$TestAttemptImpl instance) =>
    <String, dynamic>{
      'test_attempt_id': instance.testAttemptId,
      'user_id': instance.userId,
      'attempt_date': instance.attemptDate?.toIso8601String(),
      'test_rating': instance.testRating,
      'experience_rating': instance.experienceRating,
      'is_completed': instance.isCompleted,
    };
