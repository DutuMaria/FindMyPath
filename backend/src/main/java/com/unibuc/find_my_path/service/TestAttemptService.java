package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.AnswerIdListDto;
import com.unibuc.find_my_path.dto.TestAttemptRequestDto;
import com.unibuc.find_my_path.dto.TestAttemptResponseDto;
import com.unibuc.find_my_path.dto.TestResultRatingRequestDto;
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
                testAttempt.getIsCompleted()
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
        testAttempt.setIsCompleted(false);
        testAttempt.setTestRating(0);
        testAttempt.setExperienceRating(0);
        testAttemptRepository.save(testAttempt);

        return new TestAttemptResponseDto(
                testAttempt.getTestAttemptId(),
                userId,
                testAttempt.getAttemptDate(),
                testAttempt.getTestRating(),
                testAttempt.getExperienceRating(),
                testAttempt.getIsCompleted()
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
        testAttempt.setIsCompleted(true);
        testAttemptRepository.save(testAttempt);

        return new TestAttemptResponseDto(
                testAttempt.getTestAttemptId(),
                testAttempt.getUser().getUserId(),
                testAttempt.getAttemptDate(),
                testAttempt.getTestRating(),
                testAttempt.getExperienceRating(),
                testAttempt.getIsCompleted()
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
        testAttempt.setIsCompleted(true);
        
        testAttemptRepository.save(testAttempt);
    }

    public Optional<Long> hasTestAttemptInProgress(UUID userId) {
        Optional<FindMyPathUser> userOptional = findMyPathUserRepository.findById(userId);
        if (userOptional.isEmpty()) {
            throw new EntityNotFoundException("User with id " + userId + " not found.");
        }

        //return testAttemptRepository.existsByUserAndIsCompletedFalse(userOptional.get());

        Optional<TestAttempt> testAttemptOptional = testAttemptRepository.findByUserAndIsCompletedFalse(userOptional.get());

        // Return the test attempt ID if present
        return testAttemptOptional.map(TestAttempt::getTestAttemptId);
    }

        public void saveTestAndExperienceRating(long testAttemptId, TestResultRatingRequestDto request) {
        Optional<TestAttempt> testAttemptOptional = testAttemptRepository.findById(testAttemptId);
        if (testAttemptOptional.isEmpty()) {
            throw new EntityNotFoundException("Test attempt with id " + testAttemptId + " not found.");
        }

        TestAttempt testAttempt = testAttemptOptional.get();
        if (testAttempt.getIsCompleted() == null || !testAttempt.getIsCompleted()) {
            throw new IllegalStateException("Test attempt must be completed before rating.");
        }

        testAttempt.setTestRating(request.getTestRating());
        testAttempt.setExperienceRating(request.getExperienceRating());
        testAttemptRepository.save(testAttempt);
    }
}
