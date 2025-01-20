package com.unibuc.find_my_path;

import com.unibuc.find_my_path.dto.*;
import com.unibuc.find_my_path.model.*;
import com.unibuc.find_my_path.repository.QuestionRepository;
import com.unibuc.find_my_path.service.QuestionService;
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
public class QuestionServiceTest {
    @Mock
    private QuestionRepository questionRepository;

    @InjectMocks
    private QuestionService questionService;

    private Question question;

    @BeforeEach
    void setUp() {
        question = new Question();
        question.setQuestionId(1);
        question.setQuestionText("Sample Question");
        question.setAnswerList(new ArrayList<>());
    }

    @Test
    void getQuestionById_shouldReturnQuestion_whenExists() {
        when(questionRepository.findById(1)).thenReturn(Optional.of(question));

        QuestionResponseDto result = questionService.getQuestionById(1);

        assertThat(result.getQuestionId()).isEqualTo(1);
        assertThat(result.getQuestionText()).isEqualTo("Sample Question");
    }

    @Test
    void getQuestionById_shouldThrowException_whenNotFound() {
        when(questionRepository.findById(1)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> questionService.getQuestionById(1))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Question with id 1 not found.");
    }

    @Test
    void getAllQuestions_shouldReturnAllQuestions() {
        List<Question> questions = List.of(
                question,
                new Question(2, "Another Question", new ArrayList<>())
        );
        when(questionRepository.findAll()).thenReturn(questions);

        List<QuestionResponseDto> results = questionService.getAllQuestions();

        assertThat(results).hasSize(2);
        assertThat(results.get(0).getQuestionId()).isEqualTo(1);
        assertThat(results.get(1).getQuestionId()).isEqualTo(2);
    }

    @Test
    void getAllQuestionsWithAnswers_shouldReturnQuestionsWithAnswers() {
        Answer answer1 = new Answer(1, "Answer 1", question, new ArrayList<>());
        Answer answer2 = new Answer(2, "Answer 2", question, new ArrayList<>());
        question.setAnswerList(List.of(answer1, answer2));

        when(questionRepository.findAll()).thenReturn(List.of(question));

        List<QuestionAnswerListDto> results = questionService.getAllQuestionsWithAnswers();

        assertThat(results).hasSize(1);
        QuestionAnswerListDto result = results.get(0);
        assertThat(result.getQuestionId()).isEqualTo(1);
        assertThat(result.getAnswerList()).hasSize(2);
        assertThat(result.getAnswerList().get(0).getAnswerText()).isEqualTo("Answer 1");
        assertThat(result.getAnswerList().get(1).getAnswerText()).isEqualTo("Answer 2");
    }

    @Test
    void updateQuestion_shouldUpdateQuestion_whenExists() {
        QuestionRequestDto requestDto = new QuestionRequestDto("Updated Question");
        when(questionRepository.findById(1)).thenReturn(Optional.of(question));
        when(questionRepository.save(any(Question.class))).thenReturn(question);

        QuestionResponseDto result = questionService.updateQuestion(1, requestDto);

        assertThat(result.getQuestionId()).isEqualTo(1);
        assertThat(result.getQuestionText()).isEqualTo("Updated Question");
    }

    @Test
    void updateQuestion_shouldThrowException_whenNotFound() {
        QuestionRequestDto requestDto = new QuestionRequestDto("Updated Question");
        when(questionRepository.findById(1)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> questionService.updateQuestion(1, requestDto))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Question with id 1 not found.");
    }

    @Test
    void deleteQuestion_shouldDeleteQuestion_whenExists() {
        when(questionRepository.findById(1)).thenReturn(Optional.of(question));

        questionService.deleteQuestion(1);

        verify(questionRepository).delete(question);
    }

    @Test
    void deleteQuestion_shouldThrowException_whenNotFound() {
        when(questionRepository.findById(1)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> questionService.deleteQuestion(1))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Question with id 1 not found.");
    }

}
