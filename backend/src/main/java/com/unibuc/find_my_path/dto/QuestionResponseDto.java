package com.unibuc.find_my_path.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QuestionResponseDto {
    private Integer questionId;
    private String questionText;
}