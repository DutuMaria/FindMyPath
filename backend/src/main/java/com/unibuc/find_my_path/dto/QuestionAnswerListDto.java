package com.unibuc.find_my_path.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QuestionAnswerListDto {
    private Integer questionId;
    private String questionText;
    private List<AnswerResponseDto> answerList;
}
