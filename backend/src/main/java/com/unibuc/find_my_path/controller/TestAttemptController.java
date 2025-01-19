package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.dto.*;
import com.unibuc.find_my_path.service.TestAttemptService;
import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
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
    public ResponseEntity<Long> hasTestAttemptInProgress(@PathVariable UUID userId) {
        Optional<Long> hasIncompleteTest = testAttemptService.hasTestAttemptInProgress(userId);

        Long testId = hasIncompleteTest.orElse(0L);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(testId);
    }

    @PutMapping("/{id}/rate")
    public ResponseEntity<String> rateTestAndExperience(
            @PathVariable long id,
            @RequestBody @Valid TestResultRatingRequestDto request) {
        try {
            testAttemptService.saveTestAndExperienceRating(id, request);
            return ResponseEntity.ok("Test and experience ratings saved successfully.");
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (IllegalStateException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while saving the ratings.");
        }
    }

    @GetMapping("/ratings-summary")
    public ResponseEntity<RatingsResponseDto> getRatingsSummary() {
        RatingsResponseDto response = testAttemptService.getRatingsSummary();

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @PostMapping("/process-results/{testAttemptId}")
    public ResponseEntity<List<CareerDetailsResponseDto>> processTestResults(@PathVariable Long testAttemptId) {
        List<CareerDetailsResponseDto> response = testAttemptService.getTestResults(testAttemptId);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }
}
