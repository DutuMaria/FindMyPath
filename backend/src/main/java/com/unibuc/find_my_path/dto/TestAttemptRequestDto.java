package com.unibuc.find_my_path.dto;


import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TestAttemptRequestDto {
    @Min(value = 1, message = "Test rating should be between 1 and 5.")
    @Max(value = 5, message = "Test rating should be between 1 and 5.")
    private Integer testRating;

    @Min(value = 1, message = "Experience rating should be between 1 and 5.")
    @Max(value = 5, message = "Experience rating should be between 1 and 5.")
    private Integer experienceRating;
}
