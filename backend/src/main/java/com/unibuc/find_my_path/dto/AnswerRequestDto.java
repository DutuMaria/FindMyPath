package com.unibuc.find_my_path.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AnswerRequestDto {
    @NotNull(message = "Answer content must not be null.")
    @Size(min = 1, message = "Answer must contain at least one character.")
    private String answerText;
}
