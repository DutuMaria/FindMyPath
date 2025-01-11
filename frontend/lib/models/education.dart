import 'package:freezed_annotation/freezed_annotation.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
class Education with _$Education {
  factory Education({
    @JsonKey(name: 'certificate') required String certificate,
    @JsonKey(name: 'completionDate') DateTime? completionDate,
    @JsonKey(name: 'institution') String? institution,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
