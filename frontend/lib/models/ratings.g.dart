// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingsImpl _$$RatingsImplFromJson(Map<String, dynamic> json) =>
    _$RatingsImpl(
      experienceRating: (json['experienceRating'] as num).toInt(),
      contentRating: (json['testRating'] as num).toInt(),
    );

Map<String, dynamic> _$$RatingsImplToJson(_$RatingsImpl instance) =>
    <String, dynamic>{
      'experienceRating': instance.experienceRating,
      'testRating': instance.contentRating,
    };
