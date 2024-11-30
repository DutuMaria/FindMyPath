import 'package:frontend/models/answer.dart';
import 'package:frontend/models/question.dart';

class TestAttemptServices {
  List<Question> loadQuestions() {
    return [
      Question(
        questionId: 1,
        questionText: 'What is the capital of France?',
        answers: [
          Answer(answerId: 1, questionId: 1, answerText: 'Paris'),
          Answer(answerId: 2, questionId: 1, answerText: 'London'),
          Answer(answerId: 3, questionId: 1, answerText: 'Berlin'),
          Answer(answerId: 4, questionId: 1, answerText: 'Madrid'),
        ],
      ),
      Question(
        questionId: 2,
        questionText: 'Which planet is known as the Red Planet?',
        answers: [
          Answer(answerId: 5, questionId: 2, answerText: 'Earth'),
          Answer(answerId: 6, questionId: 2, answerText: 'Mars'),
          Answer(answerId: 7, questionId: 2, answerText: 'Jupiter'),
          Answer(answerId: 8, questionId: 2, answerText: 'Venus'),
        ],
      ),
    ];
  }
}
