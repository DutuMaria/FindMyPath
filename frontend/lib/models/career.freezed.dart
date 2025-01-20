// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Career _$CareerFromJson(Map<String, dynamic> json) {
  return _Career.fromJson(json);
}

/// @nodoc
mixin _$Career {
  @JsonKey(name: 'careerId')
  int get careerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'industry')
  String? get industry => throw _privateConstructorUsedError;
  @JsonKey(name: 'salaryRange')
  String? get salaryRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'experienceLevel')
  String? get experienceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'requiredSoftSkills')
  List<String>? get requiredSoftSkills => throw _privateConstructorUsedError;
  @JsonKey(name: 'requiredHardSkills')
  List<String>? get requiredHardSkills => throw _privateConstructorUsedError;

  /// Serializes this Career to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Career
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CareerCopyWith<Career> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CareerCopyWith<$Res> {
  factory $CareerCopyWith(Career value, $Res Function(Career) then) =
      _$CareerCopyWithImpl<$Res, Career>;
  @useResult
  $Res call(
      {@JsonKey(name: 'careerId') int careerId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'industry') String? industry,
      @JsonKey(name: 'salaryRange') String? salaryRange,
      @JsonKey(name: 'experienceLevel') String? experienceLevel,
      @JsonKey(name: 'requiredSoftSkills') List<String>? requiredSoftSkills,
      @JsonKey(name: 'requiredHardSkills') List<String>? requiredHardSkills});
}

/// @nodoc
class _$CareerCopyWithImpl<$Res, $Val extends Career>
    implements $CareerCopyWith<$Res> {
  _$CareerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Career
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? careerId = null,
    Object? title = null,
    Object? description = freezed,
    Object? industry = freezed,
    Object? salaryRange = freezed,
    Object? experienceLevel = freezed,
    Object? requiredSoftSkills = freezed,
    Object? requiredHardSkills = freezed,
  }) {
    return _then(_value.copyWith(
      careerId: null == careerId
          ? _value.careerId
          : careerId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      industry: freezed == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryRange: freezed == salaryRange
          ? _value.salaryRange
          : salaryRange // ignore: cast_nullable_to_non_nullable
              as String?,
      experienceLevel: freezed == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredSoftSkills: freezed == requiredSoftSkills
          ? _value.requiredSoftSkills
          : requiredSoftSkills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      requiredHardSkills: freezed == requiredHardSkills
          ? _value.requiredHardSkills
          : requiredHardSkills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CareerImplCopyWith<$Res> implements $CareerCopyWith<$Res> {
  factory _$$CareerImplCopyWith(
          _$CareerImpl value, $Res Function(_$CareerImpl) then) =
      __$$CareerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'careerId') int careerId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'industry') String? industry,
      @JsonKey(name: 'salaryRange') String? salaryRange,
      @JsonKey(name: 'experienceLevel') String? experienceLevel,
      @JsonKey(name: 'requiredSoftSkills') List<String>? requiredSoftSkills,
      @JsonKey(name: 'requiredHardSkills') List<String>? requiredHardSkills});
}

/// @nodoc
class __$$CareerImplCopyWithImpl<$Res>
    extends _$CareerCopyWithImpl<$Res, _$CareerImpl>
    implements _$$CareerImplCopyWith<$Res> {
  __$$CareerImplCopyWithImpl(
      _$CareerImpl _value, $Res Function(_$CareerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Career
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? careerId = null,
    Object? title = null,
    Object? description = freezed,
    Object? industry = freezed,
    Object? salaryRange = freezed,
    Object? experienceLevel = freezed,
    Object? requiredSoftSkills = freezed,
    Object? requiredHardSkills = freezed,
  }) {
    return _then(_$CareerImpl(
      careerId: null == careerId
          ? _value.careerId
          : careerId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      industry: freezed == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String?,
      salaryRange: freezed == salaryRange
          ? _value.salaryRange
          : salaryRange // ignore: cast_nullable_to_non_nullable
              as String?,
      experienceLevel: freezed == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredSoftSkills: freezed == requiredSoftSkills
          ? _value._requiredSoftSkills
          : requiredSoftSkills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      requiredHardSkills: freezed == requiredHardSkills
          ? _value._requiredHardSkills
          : requiredHardSkills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CareerImpl implements _Career {
  _$CareerImpl(
      {@JsonKey(name: 'careerId') required this.careerId,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'industry') this.industry,
      @JsonKey(name: 'salaryRange') this.salaryRange,
      @JsonKey(name: 'experienceLevel') this.experienceLevel,
      @JsonKey(name: 'requiredSoftSkills')
      final List<String>? requiredSoftSkills,
      @JsonKey(name: 'requiredHardSkills')
      final List<String>? requiredHardSkills})
      : _requiredSoftSkills = requiredSoftSkills,
        _requiredHardSkills = requiredHardSkills;

  factory _$CareerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CareerImplFromJson(json);

  @override
  @JsonKey(name: 'careerId')
  final int careerId;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'industry')
  final String? industry;
  @override
  @JsonKey(name: 'salaryRange')
  final String? salaryRange;
  @override
  @JsonKey(name: 'experienceLevel')
  final String? experienceLevel;
  final List<String>? _requiredSoftSkills;
  @override
  @JsonKey(name: 'requiredSoftSkills')
  List<String>? get requiredSoftSkills {
    final value = _requiredSoftSkills;
    if (value == null) return null;
    if (_requiredSoftSkills is EqualUnmodifiableListView)
      return _requiredSoftSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _requiredHardSkills;
  @override
  @JsonKey(name: 'requiredHardSkills')
  List<String>? get requiredHardSkills {
    final value = _requiredHardSkills;
    if (value == null) return null;
    if (_requiredHardSkills is EqualUnmodifiableListView)
      return _requiredHardSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Career(careerId: $careerId, title: $title, description: $description, industry: $industry, salaryRange: $salaryRange, experienceLevel: $experienceLevel, requiredSoftSkills: $requiredSoftSkills, requiredHardSkills: $requiredHardSkills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CareerImpl &&
            (identical(other.careerId, careerId) ||
                other.careerId == careerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.industry, industry) ||
                other.industry == industry) &&
            (identical(other.salaryRange, salaryRange) ||
                other.salaryRange == salaryRange) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            const DeepCollectionEquality()
                .equals(other._requiredSoftSkills, _requiredSoftSkills) &&
            const DeepCollectionEquality()
                .equals(other._requiredHardSkills, _requiredHardSkills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      careerId,
      title,
      description,
      industry,
      salaryRange,
      experienceLevel,
      const DeepCollectionEquality().hash(_requiredSoftSkills),
      const DeepCollectionEquality().hash(_requiredHardSkills));

  /// Create a copy of Career
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CareerImplCopyWith<_$CareerImpl> get copyWith =>
      __$$CareerImplCopyWithImpl<_$CareerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CareerImplToJson(
      this,
    );
  }
}

abstract class _Career implements Career {
  factory _Career(
      {@JsonKey(name: 'careerId') required final int careerId,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'industry') final String? industry,
      @JsonKey(name: 'salaryRange') final String? salaryRange,
      @JsonKey(name: 'experienceLevel') final String? experienceLevel,
      @JsonKey(name: 'requiredSoftSkills')
      final List<String>? requiredSoftSkills,
      @JsonKey(name: 'requiredHardSkills')
      final List<String>? requiredHardSkills}) = _$CareerImpl;

  factory _Career.fromJson(Map<String, dynamic> json) = _$CareerImpl.fromJson;

  @override
  @JsonKey(name: 'careerId')
  int get careerId;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'industry')
  String? get industry;
  @override
  @JsonKey(name: 'salaryRange')
  String? get salaryRange;
  @override
  @JsonKey(name: 'experienceLevel')
  String? get experienceLevel;
  @override
  @JsonKey(name: 'requiredSoftSkills')
  List<String>? get requiredSoftSkills;
  @override
  @JsonKey(name: 'requiredHardSkills')
  List<String>? get requiredHardSkills;

  /// Create a copy of Career
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CareerImplCopyWith<_$CareerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
