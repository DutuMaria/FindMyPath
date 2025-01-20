// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CareerImpl _$$CareerImplFromJson(Map<String, dynamic> json) => _$CareerImpl(
      careerId: (json['careerId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      industry: json['industry'] as String?,
      salaryRange: json['salaryRange'] as String?,
      experienceLevel: json['experienceLevel'] as String?,
      requiredSoftSkills: (json['requiredSoftSkills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requiredHardSkills: (json['requiredHardSkills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CareerImplToJson(_$CareerImpl instance) =>
    <String, dynamic>{
      'careerId': instance.careerId,
      'title': instance.title,
      'description': instance.description,
      'industry': instance.industry,
      'salaryRange': instance.salaryRange,
      'experienceLevel': instance.experienceLevel,
      'requiredSoftSkills': instance.requiredSoftSkills,
      'requiredHardSkills': instance.requiredHardSkills,
    };
