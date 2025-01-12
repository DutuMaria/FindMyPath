import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

part 'auth.g.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  factory RegisterRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    required String token,
    required String userId,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
