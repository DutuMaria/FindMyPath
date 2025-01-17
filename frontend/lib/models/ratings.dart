import 'package:freezed_annotation/freezed_annotation.dart';

part 'ratings.freezed.dart';
part 'ratings.g.dart';

@freezed
class Ratings with _$Ratings {
  factory Ratings({
    @JsonKey(name: 'experienceRating') required int experienceRating,
    @JsonKey(name: 'testRating') required int contentRating,
  }) = _Ratings;

  factory Ratings.fromJson(Map<String, dynamic> json) =>
      _$RatingsFromJson(json);
}
