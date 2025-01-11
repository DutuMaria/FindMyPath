// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTestImpl _$$UserTestImplFromJson(Map<String, dynamic> json) =>
    _$UserTestImpl(
      testAttemptId: (json['testAttemptId'] as num).toInt(),
      attemptDate: DateTime.parse(json['attemptDate'] as String),
      testRating: (json['testRating'] as num?)?.toInt(),
      experienceRating: (json['experienceRating'] as num?)?.toInt(),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$UserTestImplToJson(_$UserTestImpl instance) =>
    <String, dynamic>{
      'testAttemptId': instance.testAttemptId,
      'attemptDate': instance.attemptDate.toIso8601String(),
      'testRating': instance.testRating,
      'experienceRating': instance.experienceRating,
      'isCompleted': instance.isCompleted,
    };
