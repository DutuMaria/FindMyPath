// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestAttempt _$TestAttemptFromJson(Map<String, dynamic> json) {
  return _TestAttempt.fromJson(json);
}

/// @nodoc
mixin _$TestAttempt {
  @JsonKey(name: 'test_attempt_id')
  int get testAttemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_date')
  DateTime get attemptDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_rating')
  int? get experienceRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool get isCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_rating')
  int? get testRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this TestAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestAttemptCopyWith<TestAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestAttemptCopyWith<$Res> {
  factory $TestAttemptCopyWith(
          TestAttempt value, $Res Function(TestAttempt) then) =
      _$TestAttemptCopyWithImpl<$Res, TestAttempt>;
  @useResult
  $Res call(
      {@JsonKey(name: 'test_attempt_id') int testAttemptId,
      @JsonKey(name: 'attempt_date') DateTime attemptDate,
      @JsonKey(name: 'experience_rating') int? experienceRating,
      @JsonKey(name: 'is_completed') bool isCompleted,
      @JsonKey(name: 'test_rating') int? testRating,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class _$TestAttemptCopyWithImpl<$Res, $Val extends TestAttempt>
    implements $TestAttemptCopyWith<$Res> {
  _$TestAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testAttemptId = null,
    Object? attemptDate = null,
    Object? experienceRating = freezed,
    Object? isCompleted = null,
    Object? testRating = freezed,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      testAttemptId: null == testAttemptId
          ? _value.testAttemptId
          : testAttemptId // ignore: cast_nullable_to_non_nullable
              as int,
      attemptDate: null == attemptDate
          ? _value.attemptDate
          : attemptDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      experienceRating: freezed == experienceRating
          ? _value.experienceRating
          : experienceRating // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      testRating: freezed == testRating
          ? _value.testRating
          : testRating // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestAttemptImplCopyWith<$Res>
    implements $TestAttemptCopyWith<$Res> {
  factory _$$TestAttemptImplCopyWith(
          _$TestAttemptImpl value, $Res Function(_$TestAttemptImpl) then) =
      __$$TestAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'test_attempt_id') int testAttemptId,
      @JsonKey(name: 'attempt_date') DateTime attemptDate,
      @JsonKey(name: 'experience_rating') int? experienceRating,
      @JsonKey(name: 'is_completed') bool isCompleted,
      @JsonKey(name: 'test_rating') int? testRating,
      @JsonKey(name: 'user_id') String userId});
}

/// @nodoc
class __$$TestAttemptImplCopyWithImpl<$Res>
    extends _$TestAttemptCopyWithImpl<$Res, _$TestAttemptImpl>
    implements _$$TestAttemptImplCopyWith<$Res> {
  __$$TestAttemptImplCopyWithImpl(
      _$TestAttemptImpl _value, $Res Function(_$TestAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testAttemptId = null,
    Object? attemptDate = null,
    Object? experienceRating = freezed,
    Object? isCompleted = null,
    Object? testRating = freezed,
    Object? userId = null,
  }) {
    return _then(_$TestAttemptImpl(
      testAttemptId: null == testAttemptId
          ? _value.testAttemptId
          : testAttemptId // ignore: cast_nullable_to_non_nullable
              as int,
      attemptDate: null == attemptDate
          ? _value.attemptDate
          : attemptDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      experienceRating: freezed == experienceRating
          ? _value.experienceRating
          : experienceRating // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      testRating: freezed == testRating
          ? _value.testRating
          : testRating // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestAttemptImpl implements _TestAttempt {
  _$TestAttemptImpl(
      {@JsonKey(name: 'test_attempt_id') required this.testAttemptId,
      @JsonKey(name: 'attempt_date') required this.attemptDate,
      @JsonKey(name: 'experience_rating') required this.experienceRating,
      @JsonKey(name: 'is_completed') required this.isCompleted,
      @JsonKey(name: 'test_rating') required this.testRating,
      @JsonKey(name: 'user_id') required this.userId});

  factory _$TestAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestAttemptImplFromJson(json);

  @override
  @JsonKey(name: 'test_attempt_id')
  final int testAttemptId;
  @override
  @JsonKey(name: 'attempt_date')
  final DateTime attemptDate;
  @override
  @JsonKey(name: 'experience_rating')
  final int? experienceRating;
  @override
  @JsonKey(name: 'is_completed')
  final bool isCompleted;
  @override
  @JsonKey(name: 'test_rating')
  final int? testRating;
  @override
  @JsonKey(name: 'user_id')
  final String userId;

  @override
  String toString() {
    return 'TestAttempt(testAttemptId: $testAttemptId, attemptDate: $attemptDate, experienceRating: $experienceRating, isCompleted: $isCompleted, testRating: $testRating, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestAttemptImpl &&
            (identical(other.testAttemptId, testAttemptId) ||
                other.testAttemptId == testAttemptId) &&
            (identical(other.attemptDate, attemptDate) ||
                other.attemptDate == attemptDate) &&
            (identical(other.experienceRating, experienceRating) ||
                other.experienceRating == experienceRating) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.testRating, testRating) ||
                other.testRating == testRating) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, testAttemptId, attemptDate,
      experienceRating, isCompleted, testRating, userId);

  /// Create a copy of TestAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestAttemptImplCopyWith<_$TestAttemptImpl> get copyWith =>
      __$$TestAttemptImplCopyWithImpl<_$TestAttemptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestAttemptImplToJson(
      this,
    );
  }
}

abstract class _TestAttempt implements TestAttempt {
  factory _TestAttempt(
      {@JsonKey(name: 'test_attempt_id') required final int testAttemptId,
      @JsonKey(name: 'attempt_date') required final DateTime attemptDate,
      @JsonKey(name: 'experience_rating') required final int? experienceRating,
      @JsonKey(name: 'is_completed') required final bool isCompleted,
      @JsonKey(name: 'test_rating') required final int? testRating,
      @JsonKey(name: 'user_id')
      required final String userId}) = _$TestAttemptImpl;

  factory _TestAttempt.fromJson(Map<String, dynamic> json) =
      _$TestAttemptImpl.fromJson;

  @override
  @JsonKey(name: 'test_attempt_id')
  int get testAttemptId;
  @override
  @JsonKey(name: 'attempt_date')
  DateTime get attemptDate;
  @override
  @JsonKey(name: 'experience_rating')
  int? get experienceRating;
  @override
  @JsonKey(name: 'is_completed')
  bool get isCompleted;
  @override
  @JsonKey(name: 'test_rating')
  int? get testRating;
  @override
  @JsonKey(name: 'user_id')
  String get userId;

  /// Create a copy of TestAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestAttemptImplCopyWith<_$TestAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
