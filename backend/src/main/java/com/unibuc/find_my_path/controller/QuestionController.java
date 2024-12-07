package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.dto.AnswerResponseDto;
import com.unibuc.find_my_path.dto.QuestionAnswerListDto;
import com.unibuc.find_my_path.dto.QuestionResponseDto;
import com.unibuc.find_my_path.dto.QuestionRequestDto;
import com.unibuc.find_my_path.service.AnswerService;
import com.unibuc.find_my_path.service.QuestionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/questions")
@RequiredArgsConstructor
public class QuestionController {
    private final QuestionService questionService;
    private final AnswerService answerService;

    @GetMapping
    public ResponseEntity<List<QuestionResponseDto>> getAllQuestions() {
        List<QuestionResponseDto> response = questionService.getAllQuestions();

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @GetMapping("/answer-list")
    public ResponseEntity<List<QuestionAnswerListDto>> getAllQuestionsWithAnswers() {
        List<QuestionAnswerListDto> response = questionService.getAllQuestionsWithAnswers();

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<QuestionResponseDto> getQuestionById(@PathVariable int id) {
        QuestionResponseDto response = questionService.getQuestionById(id);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @GetMapping("/{id}/answers")
    public ResponseEntity<List<AnswerResponseDto>> getAnswersByQuestionId(@PathVariable int id) {
        List<AnswerResponseDto> response = answerService.getAnswersByQuestionId(id);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @PostMapping
    public ResponseEntity<QuestionResponseDto> addQuestion(@RequestBody @Valid QuestionRequestDto questionDto) {
        QuestionResponseDto response = questionService.addQuestion(questionDto);

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<QuestionResponseDto> updateQuestion(@PathVariable int id,
                                                              @RequestBody @Valid QuestionRequestDto questionDto) {
        QuestionResponseDto response = questionService.updateQuestion(id, questionDto);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteQuestion(@PathVariable int id) {
        questionService.deleteQuestion(id);
    }
}
