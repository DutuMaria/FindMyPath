package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.dto.*;
import com.unibuc.find_my_path.service.TestAttemptService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/test-attempts")
@RequiredArgsConstructor
public class TestAttemptController {
    private final TestAttemptService testAttemptService;

    @GetMapping("/{id}")
    public ResponseEntity<TestAttemptResponseDto> getTestAttemptById(@PathVariable long id) {
        TestAttemptResponseDto response = testAttemptService.getTestAttemptById(id);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @PostMapping("/{userId}")
    public ResponseEntity<TestAttemptResponseDto> addTestAttempt(@PathVariable UUID userId) {
        TestAttemptResponseDto response = testAttemptService.addTestAttemptByUserId(userId);

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<TestAttemptResponseDto> updateTestAttempt(@PathVariable long id,
                                                                    @RequestBody @Valid TestAttemptRequestDto testAttemptRequestDto) {
        TestAttemptResponseDto response = testAttemptService.updateTestAttempt(id, testAttemptRequestDto);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @PostMapping("/{id}/finish-test")
    @ResponseStatus(HttpStatus.OK)
    public void addAnswerListToTestAttempt(@PathVariable long id, @RequestBody AnswerIdListDto answerIdListDto) {
        testAttemptService.addAnswerListToTestAttempt(id, answerIdListDto);
    }

    @GetMapping("/{userId}/has-incomplete-test")
    public ResponseEntity<Boolean> hasTestAttemptInProgress(@PathVariable UUID userId) {
        boolean hasIncomplete = testAttemptService.hasTestAttemptInProgress(userId);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(hasIncomplete);
    }
}
