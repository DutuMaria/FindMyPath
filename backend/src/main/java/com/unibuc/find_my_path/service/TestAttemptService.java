package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.AnswerIdListDto;
import com.unibuc.find_my_path.dto.TestAttemptRequestDto;
import com.unibuc.find_my_path.dto.TestAttemptResponseDto;
import com.unibuc.find_my_path.dto.TestResultRatingRequestDto;
import com.unibuc.find_my_path.model.*;
import com.unibuc.find_my_path.repository.*;
import com.unibuc.find_my_path.utils.Utils;
import com.unibuc.find_my_path.dto.*;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TestAttemptService {
    private final TestAttemptRepository testAttemptRepository;
    private final FindMyPathUserRepository findMyPathUserRepository;
    private final AnswerRepository answerRepository;

    private final CareerService careerService;
    private final HardSkillService hardSkillService;
    private final SoftSkillService softSkillService;
    private final InterestService interestService;

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

    public RatingsResponseDto getRatingsSummary() {
        List<TestAttempt> testAttempts = testAttemptRepository.findAll();

        int sumOfExperienceRating = 0;
        int sumOfContentRating = 0;
        int numberOfRatings = 0;
        int numberOfOneExperienceRating = 0;
        int numberOfTwoExperienceRating = 0;
        int numberOfThreeExperienceRating = 0;
        int numberOfFourExperienceRating = 0;
        int numberOfFiveExperienceRating = 0;

        int numberOfOneContentRating = 0;
        int numberOfTwoContentRating = 0;
        int numberOfThreeContentRating = 0;
        int numberOfFourContentRating = 0;
        int numberOfFiveContentRating = 0;

        for (TestAttempt testAttempt : testAttempts) {

            if (testAttempt.getExperienceRating() != null && testAttempt.getTestRating() != null) {
                switch (testAttempt.getExperienceRating()) {
                    case 1 -> numberOfOneExperienceRating++;
                    case 2 -> numberOfTwoExperienceRating++;
                    case 3 -> numberOfThreeExperienceRating++;
                    case 4 -> numberOfFourExperienceRating++;
                    case 5 -> numberOfFiveExperienceRating++;
                }
                sumOfExperienceRating += testAttempt.getExperienceRating();

                switch (testAttempt.getTestRating()) {
                    case 1 -> numberOfOneContentRating++;
                    case 2 -> numberOfTwoContentRating++;
                    case 3 -> numberOfThreeContentRating++;
                    case 4 -> numberOfFourContentRating++;
                    case 5 -> numberOfFiveContentRating++;
                }
                sumOfContentRating += testAttempt.getTestRating();

                numberOfRatings++;
            }
        }

        RatingsResponseDto response = new RatingsResponseDto();

        response.setNumberOfOneExperienceRating(numberOfOneExperienceRating);
        response.setNumberOfTwoExperienceRating(numberOfTwoExperienceRating);
        response.setNumberOfThreeExperienceRating(numberOfThreeExperienceRating);
        response.setNumberOfFourExperienceRating(numberOfFourExperienceRating);
        response.setNumberOfFiveExperienceRating(numberOfFiveExperienceRating);
        response.setSumOfExperienceRating(sumOfExperienceRating);

        response.setNumberOfOneContentRating(numberOfOneContentRating);
        response.setNumberOfTwoContentRating(numberOfTwoContentRating);
        response.setNumberOfThreeContentRating(numberOfThreeContentRating);
        response.setNumberOfFourContentRating(numberOfFourContentRating);
        response.setNumberOfFiveContentRating(numberOfFiveContentRating);
        response.setSumOfContentRating(sumOfContentRating);

        response.setNumberOfRatings(numberOfRatings);

        return response;
    }

    public void processTestResults(long testAttemptId) {
        Optional<TestAttempt> testAttemptOptional = testAttemptRepository.findById(testAttemptId);
        if (testAttemptOptional.isEmpty()) {
            throw new EntityNotFoundException("Test attempt with id " + testAttemptId + " not found.");
        }

        ArrayList<ArrayList<ArrayList<String>>> answersSkillSet, careersSkillSet;
        answersSkillSet = getTestAttemptAnswersSkillSet(testAttemptOptional.get());
        careersSkillSet = careerService.getCareersSkillSet();
        ArrayList<Long> careerIds = careerService.getCareerIds();
        ArrayList<String> hardSkills = hardSkillService.getAllHardSkillNames();
        ArrayList<String> softSkills = softSkillService.getAllSoftSkillNames();
        ArrayList<String> interests = interestService.getAllInterestNames();

        Utils.executeCareerTest(answersSkillSet, careersSkillSet, careerIds, hardSkills, softSkills, interests);
    }

    public ArrayList<ArrayList<ArrayList<String>>> getTestAttemptAnswersSkillSet(TestAttempt testAttempt) {
        return testAttempt.getAnswerList().stream()
                .map(answer -> Utils.processSkillLists(
                        answer.getHardSkillList(),
                        answer.getSoftSkillList(),
                        answer.getInterestList()))
                .collect(Collectors.toCollection(ArrayList::new));
    }

}
