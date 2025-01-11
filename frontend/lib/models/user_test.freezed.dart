// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserTest _$UserTestFromJson(Map<String, dynamic> json) {
  return _UserTest.fromJson(json);
}

/// @nodoc
mixin _$UserTest {
  @JsonKey(name: 'testAttemptId')
  int get testAttemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'attemptDate')
  DateTime get attemptDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'testRating')
  int? get testRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'experienceRating')
  int? get experienceRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'isCompleted')
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this UserTest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserTestCopyWith<UserTest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTestCopyWith<$Res> {
  factory $UserTestCopyWith(UserTest value, $Res Function(UserTest) then) =
      _$UserTestCopyWithImpl<$Res, UserTest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'testAttemptId') int testAttemptId,
      @JsonKey(name: 'attemptDate') DateTime attemptDate,
      @JsonKey(name: 'testRating') int? testRating,
      @JsonKey(name: 'experienceRating') int? experienceRating,
      @JsonKey(name: 'isCompleted') bool isCompleted});
}

/// @nodoc
class _$UserTestCopyWithImpl<$Res, $Val extends UserTest>
    implements $UserTestCopyWith<$Res> {
  _$UserTestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testAttemptId = null,
    Object? attemptDate = null,
    Object? testRating = freezed,
    Object? experienceRating = freezed,
    Object? isCompleted = null,
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
      testRating: freezed == testRating
          ? _value.testRating
          : testRating // ignore: cast_nullable_to_non_nullable
              as int?,
      experienceRating: freezed == experienceRating
          ? _value.experienceRating
          : experienceRating // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTestImplCopyWith<$Res>
    implements $UserTestCopyWith<$Res> {
  factory _$$UserTestImplCopyWith(
          _$UserTestImpl value, $Res Function(_$UserTestImpl) then) =
      __$$UserTestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'testAttemptId') int testAttemptId,
      @JsonKey(name: 'attemptDate') DateTime attemptDate,
      @JsonKey(name: 'testRating') int? testRating,
      @JsonKey(name: 'experienceRating') int? experienceRating,
      @JsonKey(name: 'isCompleted') bool isCompleted});
}

/// @nodoc
class __$$UserTestImplCopyWithImpl<$Res>
    extends _$UserTestCopyWithImpl<$Res, _$UserTestImpl>
    implements _$$UserTestImplCopyWith<$Res> {
  __$$UserTestImplCopyWithImpl(
      _$UserTestImpl _value, $Res Function(_$UserTestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testAttemptId = null,
    Object? attemptDate = null,
    Object? testRating = freezed,
    Object? experienceRating = freezed,
    Object? isCompleted = null,
  }) {
    return _then(_$UserTestImpl(
      testAttemptId: null == testAttemptId
          ? _value.testAttemptId
          : testAttemptId // ignore: cast_nullable_to_non_nullable
              as int,
      attemptDate: null == attemptDate
          ? _value.attemptDate
          : attemptDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      testRating: freezed == testRating
          ? _value.testRating
          : testRating // ignore: cast_nullable_to_non_nullable
              as int?,
      experienceRating: freezed == experienceRating
          ? _value.experienceRating
          : experienceRating // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTestImpl implements _UserTest {
  _$UserTestImpl(
      {@JsonKey(name: 'testAttemptId') required this.testAttemptId,
      @JsonKey(name: 'attemptDate') required this.attemptDate,
      @JsonKey(name: 'testRating') this.testRating,
      @JsonKey(name: 'experienceRating') this.experienceRating,
      @JsonKey(name: 'isCompleted') required this.isCompleted});

  factory _$UserTestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTestImplFromJson(json);

  @override
  @JsonKey(name: 'testAttemptId')
  final int testAttemptId;
  @override
  @JsonKey(name: 'attemptDate')
  final DateTime attemptDate;
  @override
  @JsonKey(name: 'testRating')
  final int? testRating;
  @override
  @JsonKey(name: 'experienceRating')
  final int? experienceRating;
  @override
  @JsonKey(name: 'isCompleted')
  final bool isCompleted;

  @override
  String toString() {
    return 'UserTest(testAttemptId: $testAttemptId, attemptDate: $attemptDate, testRating: $testRating, experienceRating: $experienceRating, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTestImpl &&
            (identical(other.testAttemptId, testAttemptId) ||
                other.testAttemptId == testAttemptId) &&
            (identical(other.attemptDate, attemptDate) ||
                other.attemptDate == attemptDate) &&
            (identical(other.testRating, testRating) ||
                other.testRating == testRating) &&
            (identical(other.experienceRating, experienceRating) ||
                other.experienceRating == experienceRating) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, testAttemptId, attemptDate,
      testRating, experienceRating, isCompleted);

  /// Create a copy of UserTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTestImplCopyWith<_$UserTestImpl> get copyWith =>
      __$$UserTestImplCopyWithImpl<_$UserTestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTestImplToJson(
      this,
    );
  }
}

abstract class _UserTest implements UserTest {
  factory _UserTest(
          {@JsonKey(name: 'testAttemptId') required final int testAttemptId,
          @JsonKey(name: 'attemptDate') required final DateTime attemptDate,
          @JsonKey(name: 'testRating') final int? testRating,
          @JsonKey(name: 'experienceRating') final int? experienceRating,
          @JsonKey(name: 'isCompleted') required final bool isCompleted}) =
      _$UserTestImpl;

  factory _UserTest.fromJson(Map<String, dynamic> json) =
      _$UserTestImpl.fromJson;

  @override
  @JsonKey(name: 'testAttemptId')
  int get testAttemptId;
  @override
  @JsonKey(name: 'attemptDate')
  DateTime get attemptDate;
  @override
  @JsonKey(name: 'testRating')
  int? get testRating;
  @override
  @JsonKey(name: 'experienceRating')
  int? get experienceRating;
  @override
  @JsonKey(name: 'isCompleted')
  bool get isCompleted;

  /// Create a copy of UserTest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTestImplCopyWith<_$UserTestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
