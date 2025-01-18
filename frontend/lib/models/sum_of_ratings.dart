import 'package:freezed_annotation/freezed_annotation.dart';

part 'sum_of_ratings.freezed.dart';
part 'sum_of_ratings.g.dart';

@freezed
class SumOfRatings with _$SumOfRatings {
  factory SumOfRatings({
    @JsonKey(name: 'sumOfExperienceRating') required int sumOfExperienceRating,
    @JsonKey(name: 'sumOfContentRating') required int sumOfContentRating,
    @JsonKey(name: 'numberOfRatings') required int numberOfRatings,
    @JsonKey(name: 'numberOfOneExperienceRating')
    required int numberOfOneExperienceRating,
    @JsonKey(name: 'numberOfTwoExperienceRating')
    required int numberOfTwoExperienceRating,
    @JsonKey(name: 'numberOfThreeExperienceRating')
    required int numberOfThreeExperienceRating,
    @JsonKey(name: 'numberOfFourExperienceRating')
    required int numberOfFourExperienceRating,
    @JsonKey(name: 'numberOfFiveExperienceRating')
    required int numberOfFiveExperienceRating,
    @JsonKey(name: 'numberOfOneContentRating')
    required int numberOfOneContentRating,
    @JsonKey(name: 'numberOfTwoContentRating')
    required int numberOfTwoContentRating,
    @JsonKey(name: 'numberOfThreeContentRating')
    required int numberOfThreeContentRating,
    @JsonKey(name: 'numberOfFourContentRating')
    required int numberOfFourContentRating,
    @JsonKey(name: 'numberOfFiveContentRating')
    required int numberOfFiveContentRating,
  }) = _SumOfRatings;

  factory SumOfRatings.fromJson(Map<String, dynamic> json) =>
      _$SumOfRatingsFromJson(json);
}
