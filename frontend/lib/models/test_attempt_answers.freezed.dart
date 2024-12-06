// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_attempt_answers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestAttemptAnswers _$TestAttemptAnswersFromJson(Map<String, dynamic> json) {
  return _TestAttemptAnswers.fromJson(json);
}

/// @nodoc
mixin _$TestAttemptAnswers {
  @JsonKey(name: 'test_attempt_id')
  int get testAttemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_id')
  int get answerId => throw _privateConstructorUsedError;

  /// Serializes this TestAttemptAnswers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestAttemptAnswers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestAttemptAnswersCopyWith<TestAttemptAnswers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestAttemptAnswersCopyWith<$Res> {
  factory $TestAttemptAnswersCopyWith(
          TestAttemptAnswers value, $Res Function(TestAttemptAnswers) then) =
      _$TestAttemptAnswersCopyWithImpl<$Res, TestAttemptAnswers>;
  @useResult
  $Res call(
      {@JsonKey(name: 'test_attempt_id') int testAttemptId,
      @JsonKey(name: 'answer_id') int answerId});
}

/// @nodoc
class _$TestAttemptAnswersCopyWithImpl<$Res, $Val extends TestAttemptAnswers>
    implements $TestAttemptAnswersCopyWith<$Res> {
  _$TestAttemptAnswersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestAttemptAnswers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testAttemptId = null,
    Object? answerId = null,
  }) {
    return _then(_value.copyWith(
      testAttemptId: null == testAttemptId
          ? _value.testAttemptId
          : testAttemptId // ignore: cast_nullable_to_non_nullable
              as int,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestAttemptAnswersImplCopyWith<$Res>
    implements $TestAttemptAnswersCopyWith<$Res> {
  factory _$$TestAttemptAnswersImplCopyWith(_$TestAttemptAnswersImpl value,
          $Res Function(_$TestAttemptAnswersImpl) then) =
      __$$TestAttemptAnswersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'test_attempt_id') int testAttemptId,
      @JsonKey(name: 'answer_id') int answerId});
}

/// @nodoc
class __$$TestAttemptAnswersImplCopyWithImpl<$Res>
    extends _$TestAttemptAnswersCopyWithImpl<$Res, _$TestAttemptAnswersImpl>
    implements _$$TestAttemptAnswersImplCopyWith<$Res> {
  __$$TestAttemptAnswersImplCopyWithImpl(_$TestAttemptAnswersImpl _value,
      $Res Function(_$TestAttemptAnswersImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestAttemptAnswers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testAttemptId = null,
    Object? answerId = null,
  }) {
    return _then(_$TestAttemptAnswersImpl(
      testAttemptId: null == testAttemptId
          ? _value.testAttemptId
          : testAttemptId // ignore: cast_nullable_to_non_nullable
              as int,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestAttemptAnswersImpl implements _TestAttemptAnswers {
  _$TestAttemptAnswersImpl(
      {@JsonKey(name: 'test_attempt_id') required this.testAttemptId,
      @JsonKey(name: 'answer_id') required this.answerId});

  factory _$TestAttemptAnswersImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestAttemptAnswersImplFromJson(json);

  @override
  @JsonKey(name: 'test_attempt_id')
  final int testAttemptId;
  @override
  @JsonKey(name: 'answer_id')
  final int answerId;

  @override
  String toString() {
    return 'TestAttemptAnswers(testAttemptId: $testAttemptId, answerId: $answerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestAttemptAnswersImpl &&
            (identical(other.testAttemptId, testAttemptId) ||
                other.testAttemptId == testAttemptId) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, testAttemptId, answerId);

  /// Create a copy of TestAttemptAnswers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestAttemptAnswersImplCopyWith<_$TestAttemptAnswersImpl> get copyWith =>
      __$$TestAttemptAnswersImplCopyWithImpl<_$TestAttemptAnswersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestAttemptAnswersImplToJson(
      this,
    );
  }
}

abstract class _TestAttemptAnswers implements TestAttemptAnswers {
  factory _TestAttemptAnswers(
          {@JsonKey(name: 'test_attempt_id') required final int testAttemptId,
          @JsonKey(name: 'answer_id') required final int answerId}) =
      _$TestAttemptAnswersImpl;

  factory _TestAttemptAnswers.fromJson(Map<String, dynamic> json) =
      _$TestAttemptAnswersImpl.fromJson;

  @override
  @JsonKey(name: 'test_attempt_id')
  int get testAttemptId;
  @override
  @JsonKey(name: 'answer_id')
  int get answerId;

  /// Create a copy of TestAttemptAnswers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestAttemptAnswersImplCopyWith<_$TestAttemptAnswersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
