import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/models/education.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'lastName') required String lastName,
    @JsonKey(name: 'educationList') List<Education>? educationList,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class UpdateUserProfile with  _$UpdateUserProfile {
  factory UpdateUserProfile({
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'lastName') required String lastName,
  }) = _UpdateUserProfile;

  factory UpdateUserProfile.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserProfileFromJson(json);
}
