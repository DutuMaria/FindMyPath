package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.dto.AnswerRequestDto;
import com.unibuc.find_my_path.dto.AnswerResponseDto;
import com.unibuc.find_my_path.service.AnswerService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @PutMapping("/{id}")
    public ResponseEntity<AnswerResponseDto> updateAnswer(@PathVariable int id,
                                                          @RequestBody @Valid AnswerRequestDto answerRequestDto) {
        AnswerResponseDto response = answerService.updateAnswer(id, answerRequestDto);

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
