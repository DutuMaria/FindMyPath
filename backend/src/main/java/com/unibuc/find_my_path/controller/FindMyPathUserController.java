package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.dto.TestAttemptResponseDto;
import com.unibuc.find_my_path.service.TestAttemptService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/users")
@RequiredArgsConstructor
public class FindMyPathUserController {
    private final TestAttemptService testAttemptService;

    @PostMapping("/{id}/test-attempt")
    public ResponseEntity<TestAttemptResponseDto> addTestAttemptByUserId(@PathVariable("id") UUID id) {
        TestAttemptResponseDto response = testAttemptService.addTestAttemptByUserId(id);

        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(response);
    }
}
