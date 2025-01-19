package com.unibuc.find_my_path;

import com.unibuc.find_my_path.dto.AnswerRequestDto;
import com.unibuc.find_my_path.dto.AnswerResponseDto;
import com.unibuc.find_my_path.model.*;
import com.unibuc.find_my_path.repository.AnswerRepository;
import com.unibuc.find_my_path.repository.QuestionRepository;
import com.unibuc.find_my_path.service.AnswerService;
import jakarta.persistence.EntityNotFoundException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

import static org.assertj.core.api.AssertionsForClassTypes.assertThatThrownBy;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class AnswerServiceTest {

    @Mock
    private AnswerRepository answerRepository;

    @Mock
    private QuestionRepository questionRepository;

    @InjectMocks
    private AnswerService answerService;

    private Answer answer;
    private Question question;

    @BeforeEach
    void setUp() {
        answer = new Answer();
        answer.setAnswerId(1);
        answer.setAnswerText("Sample Answer");

        question = new Question();
        question.setQuestionId(1);
        question.setQuestionText("Sample Question");
        question.setAnswerList(new ArrayList<>());
    }

    @Test
    void getAnswerById_shouldReturnAnswer_whenAnswerExists() {
        when(answerRepository.findById(1)).thenReturn(Optional.of(answer));

        AnswerResponseDto result = answerService.getAnswerById(1);

        assertThat(result.getAnswerId()).isEqualTo(1);
        assertThat(result.getAnswerText()).isEqualTo("Sample Answer");
    }

    @Test
    void getAnswerById_shouldThrowException_whenAnswerNotFound() {
        when(answerRepository.findById(1)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> answerService.getAnswerById(1))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Answer with id 1 not found");
    }

    @Test
    void getAnswersByQuestionId_shouldReturnAnswers_whenQuestionExists() {
        question.getAnswerList().add(answer);
        when(questionRepository.findById(1)).thenReturn(Optional.of(question));

        List<AnswerResponseDto> results = answerService.getAnswersByQuestionId(1);

        assertThat(results).hasSize(1);
        assertThat(results.get(0).getAnswerId()).isEqualTo(1);
        assertThat(results.get(0).getAnswerText()).isEqualTo("Sample Answer");
    }

    @Test
    void getAnswersByQuestionId_shouldThrowException_whenQuestionNotFound() {
        when(questionRepository.findById(1)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> answerService.getAnswersByQuestionId(1))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Question with id 1 not found");
    }

    @Test
    void updateAnswer_shouldUpdateAnswer_whenAnswerExists() {
        AnswerRequestDto request = new AnswerRequestDto();
        request.setAnswerText("Updated Answer");

        when(answerRepository.findById(1)).thenReturn(Optional.of(answer));
        when(answerRepository.save(any(Answer.class))).thenReturn(answer);

        AnswerResponseDto result = answerService.updateAnswer(1, request);

        assertThat(result.getAnswerId()).isEqualTo(1);
        assertThat(result.getAnswerText()).isEqualTo("Updated Answer");
    }

    @Test
    void updateAnswer_shouldThrowException_whenAnswerNotFound() {
        AnswerRequestDto request = new AnswerRequestDto();
        request.setAnswerText("Updated Answer");

        when(answerRepository.findById(1)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> answerService.updateAnswer(1, request))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Answer with id 1 not found");
    }

    @Test
    void deleteAnswer_shouldDeleteAnswer_whenAnswerExists() {
        when(answerRepository.findById(1)).thenReturn(Optional.of(answer));

        answerService.deleteAnswer(1);

        verify(answerRepository).deleteById(1);
    }

    @Test
    void deleteAnswer_shouldThrowException_whenAnswerNotFound() {
        when(answerRepository.findById(1)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> answerService.deleteAnswer(1))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Answer with id 1 not found");
    }


}
