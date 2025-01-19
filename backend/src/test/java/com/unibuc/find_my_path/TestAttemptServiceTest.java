package com.unibuc.find_my_path;

import com.unibuc.find_my_path.dto.*;
import com.unibuc.find_my_path.model.*;
import com.unibuc.find_my_path.repository.AnswerRepository;
import com.unibuc.find_my_path.repository.FindMyPathUserRepository;
import com.unibuc.find_my_path.repository.TestAttemptRepository;
import com.unibuc.find_my_path.service.TestAttemptService;
import jakarta.persistence.EntityNotFoundException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;

import static org.assertj.core.api.AssertionsForClassTypes.assertThatThrownBy;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class TestAttemptServiceTest {
    @Mock
    private TestAttemptRepository testAttemptRepository;

    @Mock
    private FindMyPathUserRepository findMyPathUserRepository;

    @Mock
    private AnswerRepository answerRepository;

    @InjectMocks
    private TestAttemptService testAttemptService;

    private TestAttempt testAttempt;
    private FindMyPathUser user;

    @BeforeEach
    void setUp() {
        user = new FindMyPathUser();
        user.setUserId(UUID.randomUUID());
        user.setEmail("test@example.com");

        testAttempt = new TestAttempt();
        testAttempt.setTestAttemptId(1L);
        testAttempt.setUser(user);
        testAttempt.setAttemptDate(LocalDateTime.now());
        testAttempt.setIsCompleted(false);
        testAttempt.setTestRating(0);
        testAttempt.setExperienceRating(0);
        testAttempt.setAnswerList(new ArrayList<>());
    }

    @Test
    void getTestAttemptById_shouldReturnTestAttempt_whenExists() {
        when(testAttemptRepository.findById(1L)).thenReturn(Optional.of(testAttempt));

        TestAttemptResponseDto result = testAttemptService.getTestAttemptById(1L);

        assertThat(result.getTestAttemptId()).isEqualTo(1L);
        assertThat(result.getUserId()).isEqualTo(user.getUserId());
        assertThat(result.getIsCompleted()).isFalse();
    }

    @Test
    void getTestAttemptById_shouldThrowException_whenNotFound() {
        when(testAttemptRepository.findById(1L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> testAttemptService.getTestAttemptById(1L))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Test attempt with id 1 not found.");
    }

    @Test
    void addTestAttemptByUserId_shouldThrowException_whenUserNotFound() {
        when(findMyPathUserRepository.findById(user.getUserId())).thenReturn(Optional.empty());

        assertThatThrownBy(() -> testAttemptService.addTestAttemptByUserId(user.getUserId()))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("User with id " + user.getUserId() + " not found.");
    }

    @Test
    void updateTestAttempt_shouldUpdateRatings_whenTestAttemptExists() {
        TestAttemptRequestDto requestDto = new TestAttemptRequestDto();
        requestDto.setTestRating(4);
        requestDto.setExperienceRating(5);

        when(testAttemptRepository.findById(1L)).thenReturn(Optional.of(testAttempt));
        when(testAttemptRepository.save(any(TestAttempt.class))).thenReturn(testAttempt);

        TestAttemptResponseDto result = testAttemptService.updateTestAttempt(1L, requestDto);

        assertThat(result.getTestRating()).isEqualTo(4);
        assertThat(result.getExperienceRating()).isEqualTo(5);
        assertThat(result.getIsCompleted()).isTrue();
    }

    @Test
    void updateTestAttempt_shouldThrowException_whenNotFound() {
        TestAttemptRequestDto requestDto = new TestAttemptRequestDto();
        requestDto.setTestRating(4);
        requestDto.setExperienceRating(5);

        when(testAttemptRepository.findById(1L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> testAttemptService.updateTestAttempt(1L, requestDto))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Test attempt with id 1 not found.");
    }

    @Test
    void addAnswerListToTestAttempt_shouldAddAnswers_whenValid() {
        Answer answer1 = new Answer(1, "Answer 1", null, new ArrayList<>());
        Answer answer2 = new Answer(2, "Answer 2", null, new ArrayList<>());
        AnswerIdListDto answerIdListDto = new AnswerIdListDto(List.of(1, 2));

        when(testAttemptRepository.findById(1L)).thenReturn(Optional.of(testAttempt));
        when(answerRepository.findById(1)).thenReturn(Optional.of(answer1));
        when(answerRepository.findById(2)).thenReturn(Optional.of(answer2));

        testAttemptService.addAnswerListToTestAttempt(1L, answerIdListDto);

        assertThat(testAttempt.getAnswerList()).hasSize(2);
        verify(testAttemptRepository).save(testAttempt);
    }

    @Test
    void addAnswerListToTestAttempt_shouldThrowException_whenTestAttemptNotFound() {
        AnswerIdListDto answerIdListDto = new AnswerIdListDto(List.of(1, 2));
        when(testAttemptRepository.findById(1L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> testAttemptService.addAnswerListToTestAttempt(1L, answerIdListDto))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Test attempt with id 1 not found.");
    }

    @Test
    void hasTestAttemptInProgress_shouldReturnTestAttemptId_whenExists() {
        when(findMyPathUserRepository.findById(user.getUserId())).thenReturn(Optional.of(user));
        when(testAttemptRepository.findByUserAndIsCompletedFalse(user)).thenReturn(Optional.of(testAttempt));

        Optional<Long> result = testAttemptService.hasTestAttemptInProgress(user.getUserId());

        assertThat(result).isPresent();
        assertThat(result.get()).isEqualTo(1L);
    }

    @Test
    void hasTestAttemptInProgress_shouldThrowException_whenUserNotFound() {
        when(findMyPathUserRepository.findById(user.getUserId())).thenReturn(Optional.empty());

        assertThatThrownBy(() -> testAttemptService.hasTestAttemptInProgress(user.getUserId()))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("User with id " + user.getUserId() + " not found.");
    }


}
