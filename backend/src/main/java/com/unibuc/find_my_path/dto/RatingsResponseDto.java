package com.unibuc.find_my_path.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RatingsResponseDto {
    private Integer sumOfExperienceRating;
    private Integer sumOfContentRating;
    private Integer numberOfRatings;

    private Integer numberOfOneExperienceRating;
    private Integer numberOfTwoExperienceRating;
    private Integer numberOfThreeExperienceRating;
    private Integer numberOfFourExperienceRating;
    private Integer numberOfFiveExperienceRating;

    private Integer numberOfOneContentRating;
    private Integer numberOfTwoContentRating;
    private Integer numberOfThreeContentRating;
    private Integer numberOfFourContentRating;
    private Integer numberOfFiveContentRating;
}