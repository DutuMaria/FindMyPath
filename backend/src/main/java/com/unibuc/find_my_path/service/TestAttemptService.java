package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.AnswerIdListDto;
import com.unibuc.find_my_path.dto.TestAttemptRequestDto;
import com.unibuc.find_my_path.dto.TestAttemptResponseDto;
import com.unibuc.find_my_path.model.Answer;
import com.unibuc.find_my_path.model.FindMyPathUser;
import com.unibuc.find_my_path.model.TestAttempt;
import com.unibuc.find_my_path.repository.AnswerRepository;
import com.unibuc.find_my_path.repository.FindMyPathUserRepository;
import com.unibuc.find_my_path.repository.TestAttemptRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TestAttemptService {
    private final TestAttemptRepository testAttemptRepository;
    private final FindMyPathUserRepository findMyPathUserRepository;
    private final AnswerRepository answerRepository;

    public TestAttemptResponseDto getTestAttemptById(long testAttemptId) {
        Optional<TestAttempt> testAttemptOptional = testAttemptRepository.findById(testAttemptId);
        if (testAttemptOptional.isEmpty()) {
            throw new EntityNotFoundException("Test attempt with id " + testAttemptId + " not found.");
        }

        TestAttempt testAttempt = testAttemptOptional.get();
        return new TestAttemptResponseDto(
                testAttempt.getTestAttemptId(),
                testAttempt.getUser().getUserId(),
                testAttempt.getAttemptDate(),
                testAttempt.getTestRating(),
                testAttempt.getExperienceRating(),
                testAttempt.isCompleted()
        );
    }

    public TestAttemptResponseDto addTestAttemptByUserId(UUID userId) {
        Optional<FindMyPathUser> userOptional = findMyPathUserRepository.findById(userId);
        if (userOptional.isEmpty()) {
            throw new EntityNotFoundException("User with id " + userId + " not found.");
        }

        TestAttempt testAttempt = new TestAttempt();
        testAttempt.setUser(userOptional.get());
        testAttempt.setAttemptDate(LocalDateTime.now());
        testAttempt.setCompleted(false);
        testAttemptRepository.save(testAttempt);

        return new TestAttemptResponseDto(
                testAttempt.getTestAttemptId(),
                userId,
                testAttempt.getAttemptDate(),
                testAttempt.getTestRating(),
                testAttempt.getExperienceRating(),
                testAttempt.isCompleted()
        );
    }

    public TestAttemptResponseDto updateTestAttempt(long testAttemptId, TestAttemptRequestDto testAttemptRequestDto) {
        Optional<TestAttempt> testAttemptOptional = testAttemptRepository.findById(testAttemptId);
        if (testAttemptOptional.isEmpty()) {
            throw new EntityNotFoundException("Test attempt with id " + testAttemptId + " not found.");
        }

        TestAttempt testAttempt = testAttemptOptional.get();
        testAttempt.setTestRating(testAttemptRequestDto.getTestRating());
        testAttempt.setExperienceRating(testAttemptRequestDto.getExperienceRating());
        testAttemptRepository.save(testAttempt);

        return new TestAttemptResponseDto(
                testAttempt.getTestAttemptId(),
                testAttempt.getUser().getUserId(),
                testAttempt.getAttemptDate(),
                testAttempt.getTestRating(),
                testAttempt.getExperienceRating(),
                testAttempt.isCompleted()
        );
    }

    public void addAnswerListToTestAttempt(long testAttemptId, AnswerIdListDto answerIdListDto) {
        Optional<TestAttempt> testAttemptOptional = testAttemptRepository.findById(testAttemptId);
        if (testAttemptOptional.isEmpty()) {
            throw new EntityNotFoundException("Test attempt with id " + testAttemptId + " not found.");
        }

        List<Answer> answers = answerIdListDto.getAnswerIds().stream()
                .map(answerId -> answerRepository.findById(answerId)
                        .orElseThrow(() -> new EntityNotFoundException("Answer with id " + answerId + " not found.")))
                .toList();

        TestAttempt testAttempt = testAttemptOptional.get();
        testAttempt.getAnswerList().addAll(answers);
        answers.forEach(answer -> answer.getTestAttemptList().add(testAttempt));
        testAttempt.setCompleted(true);
        
        testAttemptRepository.save(testAttempt);
    }
}
