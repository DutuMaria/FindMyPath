import 'package:freezed_annotation/freezed_annotation.dart';

part 'career.freezed.dart';
part 'career.g.dart';

@freezed
class Career with _$Career {
  factory Career({
    @JsonKey(name: 'careerId') required int careerId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'industry') String? industry,
    @JsonKey(name: 'salaryRange') String? salaryRange,
    @JsonKey(name: 'experienceLevel') String? experienceLevel,
    @JsonKey(name: 'requiredSoftSkills') List<String>? requiredSoftSkills,
    @JsonKey(name: 'requiredHardSkills') List<String>? requiredHardSkills,
  }) = _Career;

  factory Career.fromJson(Map<String, dynamic> json) => _$CareerFromJson(json);
}
