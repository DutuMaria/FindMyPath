package com.unibuc.find_my_path.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TestAttemptResponseDto {
    private long testAttemptId;
    private UUID userId;
    private LocalDateTime attemptDate;
    private int testRating;
    private int experienceRating;
    private boolean isCompleted;
}
