package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.AnswerResponseDto;
import com.unibuc.find_my_path.dto.QuestionAnswerListDto;
import com.unibuc.find_my_path.dto.QuestionResponseDto;
import com.unibuc.find_my_path.dto.QuestionRequestDto;
import com.unibuc.find_my_path.model.Question;
import com.unibuc.find_my_path.repository.QuestionRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class QuestionService {
    private final QuestionRepository questionRepository;

    public QuestionResponseDto getQuestionById(int questionId) {
        Optional<Question> question = questionRepository.findById(questionId);
        if (question.isEmpty()) {
            throw new EntityNotFoundException("Question with id " + questionId + " not found.");
        }

        return new QuestionResponseDto(question.get().getQuestionId(), question.get().getQuestionText());
    }

    public List<QuestionResponseDto> getAllQuestions() {
        return questionRepository
                .findAll()
                .stream()
                .map(question -> new QuestionResponseDto(question.getQuestionId(), question.getQuestionText()))
                .collect(Collectors.toList());
    }

    public List<QuestionAnswerListDto> getAllQuestionsWithAnswers() {
        return questionRepository.findAll().stream()
                .map(question -> new QuestionAnswerListDto(
                        question.getQuestionId(),
                        question.getQuestionText(),
                        question.getAnswerList().stream()
                                .map(answer -> new AnswerResponseDto(
                                        answer.getAnswerId(),
                                        answer.getAnswerText()
                                ))
                                .collect(Collectors.toList())
                ))
                .collect(Collectors.toList());
    }

    public QuestionResponseDto addQuestion(QuestionRequestDto questionDto) {
        Question question = new Question();
        question.setQuestionText(questionDto.getQuestionText());
        questionRepository.save(question);

        return new QuestionResponseDto(question.getQuestionId(), question.getQuestionText());
    }

    public QuestionResponseDto updateQuestion(int questionId, QuestionRequestDto questionDto) {
        Optional<Question> questionOptional = questionRepository.findById(questionId);
        if (questionOptional.isEmpty()) {
            throw new EntityNotFoundException("Question with id " + questionId + " not found.");
        }

        Question question = questionOptional.get();
        question.setQuestionText(questionDto.getQuestionText());
        questionRepository.save(question);

        return new QuestionResponseDto(question.getQuestionId(), question.getQuestionText());
    }

    public void deleteQuestion(int questionId) {
        Optional<Question> question = questionRepository.findById(questionId);
        if (question.isEmpty()) {
            throw new EntityNotFoundException("Question with id " + questionId + " not found.");
        }

        questionRepository.delete(question.get());
    }
}
