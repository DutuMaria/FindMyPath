package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.dto.AnswerRequestDto;
import com.unibuc.find_my_path.dto.AnswerResponseDto;
import com.unibuc.find_my_path.dto.QuestionAnswerListDto;
import com.unibuc.find_my_path.service.AnswerService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/answers")
@RequiredArgsConstructor
public class AnswerController {
    private final AnswerService answerService;

    @GetMapping("/{id}")
    public ResponseEntity<AnswerResponseDto> getAnswerById(@PathVariable int id) {
        AnswerResponseDto response = answerService.getAnswerById(id);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @PostMapping("/{questionId}")
    public ResponseEntity<AnswerResponseDto> addAnswerToQuestion(@PathVariable int questionId,
                                                       @RequestBody @Valid AnswerRequestDto answerRequestDto) {
        AnswerResponseDto response = answerService.addAnswerToQuestion(questionId, answerRequestDto);

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }

    @PostMapping("/add-answers/{questionId}")
    public ResponseEntity<List<AnswerResponseDto>> addAnswersToQuestion(
            @PathVariable int questionId,
            @RequestBody List<AnswerRequestDto> answerDtos) {

        List<AnswerResponseDto> responseDtos = answerService.addAnswersToQuestion(questionId, answerDtos);
        return ResponseEntity.
                status(HttpStatus.CREATED).
                body(responseDtos);
    }

    @PutMapping("/{id}")
    public ResponseEntity<AnswerResponseDto> updateAnswer(@PathVariable int id,
                                                          @RequestBody @Valid AnswerRequestDto answerRequestDto) {
        AnswerResponseDto response = answerService.updateAnswer(id, answerRequestDto);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @PutMapping("/update-answers")
    public ResponseEntity<QuestionAnswerListDto> updateQuestionAnswers(
            @RequestBody QuestionAnswerListDto questionAnswerListDto) {

        QuestionAnswerListDto response = answerService.updateQuestionAnswers(questionAnswerListDto);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteAnswer(@PathVariable int id) {
        answerService.deleteAnswer(id);
    }
}
