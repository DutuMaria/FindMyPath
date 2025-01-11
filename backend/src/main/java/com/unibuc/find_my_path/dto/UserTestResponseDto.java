package com.unibuc.find_my_path.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserTestResponseDto {
    private LocalDateTime attemptDate;
    private Integer testRating;
    private Integer experienceRating;
    private Boolean isCompleted;
}
