package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.AnswerRequestDto;
import com.unibuc.find_my_path.dto.AnswerResponseDto;
import com.unibuc.find_my_path.model.Answer;
import com.unibuc.find_my_path.model.Question;
import com.unibuc.find_my_path.repository.AnswerRepository;
import com.unibuc.find_my_path.repository.QuestionRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class AnswerService {
    private final AnswerRepository answerRepository;
    private final QuestionRepository questionRepository;

    public AnswerResponseDto getAnswerById(int answerId) {
        Optional<Answer> answer = answerRepository.findById(answerId);
        if (answer.isEmpty()) {
            throw new EntityNotFoundException("Answer with id " + answerId + " not found");
        }

        return new AnswerResponseDto(answer.get().getAnswerId(), answer.get().getAnswerText());
    }

    public List<AnswerResponseDto> getAnswersByQuestionId(int questionId) {
        Optional<Question> question = questionRepository.findById(questionId);
        if (question.isEmpty()) {
            throw new EntityNotFoundException("Question with id " + questionId + " not found");
        }

        return question.get()
                .getAnswerList()
                .stream()
                .map(answer -> new AnswerResponseDto(answer.getAnswerId(), answer.getAnswerText()))
                .toList();
    }

    public AnswerResponseDto addAnswerToQuestion(int questionId, AnswerRequestDto answerDto) {
        Optional<Question> question = questionRepository.findById(questionId);
        if (question.isEmpty()) {
            throw new EntityNotFoundException("Question with id " + questionId + " not found");
        }

        Question questionEntity = question.get();

        Answer answer = new Answer();
        answer.setAnswerText(answerDto.getAnswerText());
        answer.setQuestion(questionEntity);
        questionEntity.getAnswerList().add(answer);

        answerRepository.save(answer);

        return new AnswerResponseDto(answer.getAnswerId(), answer.getAnswerText());
    }

    public AnswerResponseDto updateAnswer(int answerId, AnswerRequestDto answerDto) {
        Optional<Answer> answer = answerRepository.findById(answerId);
        if (answer.isEmpty()) {
            throw new EntityNotFoundException("Answer with id " + answerId + " not found");
        }

        Answer updatedAnswer = answer.get();
        updatedAnswer.setAnswerText(answerDto.getAnswerText());
        answerRepository.save(updatedAnswer);

        return new AnswerResponseDto(updatedAnswer.getAnswerId(), updatedAnswer.getAnswerText());
    }

    public void deleteAnswer(int answerId) {
        Optional<Answer> answer = answerRepository.findById(answerId);
        if (answer.isEmpty()) {
            throw new EntityNotFoundException("Answer with id " + answerId + " not found");
        }

        answerRepository.deleteById(answerId);
    }
}
