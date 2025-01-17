// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ratings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ratings _$RatingsFromJson(Map<String, dynamic> json) {
  return _Ratings.fromJson(json);
}

/// @nodoc
mixin _$Ratings {
  @JsonKey(name: 'experienceRating')
  int get experienceRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'testRating')
  int get contentRating => throw _privateConstructorUsedError;

  /// Serializes this Ratings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RatingsCopyWith<Ratings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingsCopyWith<$Res> {
  factory $RatingsCopyWith(Ratings value, $Res Function(Ratings) then) =
      _$RatingsCopyWithImpl<$Res, Ratings>;
  @useResult
  $Res call(
      {@JsonKey(name: 'experienceRating') int experienceRating,
      @JsonKey(name: 'testRating') int contentRating});
}

/// @nodoc
class _$RatingsCopyWithImpl<$Res, $Val extends Ratings>
    implements $RatingsCopyWith<$Res> {
  _$RatingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experienceRating = null,
    Object? contentRating = null,
  }) {
    return _then(_value.copyWith(
      experienceRating: null == experienceRating
          ? _value.experienceRating
          : experienceRating // ignore: cast_nullable_to_non_nullable
              as int,
      contentRating: null == contentRating
          ? _value.contentRating
          : contentRating // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingsImplCopyWith<$Res> implements $RatingsCopyWith<$Res> {
  factory _$$RatingsImplCopyWith(
          _$RatingsImpl value, $Res Function(_$RatingsImpl) then) =
      __$$RatingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'experienceRating') int experienceRating,
      @JsonKey(name: 'testRating') int contentRating});
}

/// @nodoc
class __$$RatingsImplCopyWithImpl<$Res>
    extends _$RatingsCopyWithImpl<$Res, _$RatingsImpl>
    implements _$$RatingsImplCopyWith<$Res> {
  __$$RatingsImplCopyWithImpl(
      _$RatingsImpl _value, $Res Function(_$RatingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experienceRating = null,
    Object? contentRating = null,
  }) {
    return _then(_$RatingsImpl(
      experienceRating: null == experienceRating
          ? _value.experienceRating
          : experienceRating // ignore: cast_nullable_to_non_nullable
              as int,
      contentRating: null == contentRating
          ? _value.contentRating
          : contentRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingsImpl implements _Ratings {
  _$RatingsImpl(
      {@JsonKey(name: 'experienceRating') required this.experienceRating,
      @JsonKey(name: 'testRating') required this.contentRating});

  factory _$RatingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingsImplFromJson(json);

  @override
  @JsonKey(name: 'experienceRating')
  final int experienceRating;
  @override
  @JsonKey(name: 'testRating')
  final int contentRating;

  @override
  String toString() {
    return 'Ratings(experienceRating: $experienceRating, contentRating: $contentRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingsImpl &&
            (identical(other.experienceRating, experienceRating) ||
                other.experienceRating == experienceRating) &&
            (identical(other.contentRating, contentRating) ||
                other.contentRating == contentRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, experienceRating, contentRating);

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingsImplCopyWith<_$RatingsImpl> get copyWith =>
      __$$RatingsImplCopyWithImpl<_$RatingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingsImplToJson(
      this,
    );
  }
}

abstract class _Ratings implements Ratings {
  factory _Ratings(
      {@JsonKey(name: 'experienceRating') required final int experienceRating,
      @JsonKey(name: 'testRating')
      required final int contentRating}) = _$RatingsImpl;

  factory _Ratings.fromJson(Map<String, dynamic> json) = _$RatingsImpl.fromJson;

  @override
  @JsonKey(name: 'experienceRating')
  int get experienceRating;
  @override
  @JsonKey(name: 'testRating')
  int get contentRating;

  /// Create a copy of Ratings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingsImplCopyWith<_$RatingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
