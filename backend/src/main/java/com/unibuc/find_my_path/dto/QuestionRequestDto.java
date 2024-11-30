package com.unibuc.find_my_path.dto;

import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QuestionRequestDto {
    @NotNull(message = "Question content must not be null.")
    @Size(min = 1, message = "Question must contain at least one character.")
    private String questionText;
}
