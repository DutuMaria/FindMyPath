import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/models/answer.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/models/test_attempt.dart';
import 'package:frontend/utils/error_handling.dart';
import 'package:http/http.dart' as http;

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
      Question(
        questionId: 3,
        questionText: 'Which planet is known as the Earth Planet?',
        answers: [
          Answer(answerId: 9, questionId: 3, answerText: 'Earth'),
          Answer(answerId: 10, questionId: 3, answerText: 'Mars'),
          Answer(answerId: 11, questionId: 3, answerText: 'Jupiter'),
          Answer(answerId: 12, questionId: 3, answerText: 'Venus'),
        ],
      ),
    ];
  }

  void startTestAttempt({
    required BuildContext context,
    required String userId,
  }) async {
    try {
      TestAttempt testAttempt = TestAttempt(
        testAttemptId: 0,
        attemptDate: DateTime.now(),
        experienceRating: null,
        isCompleted: false,
        testRating: null,
        userId: userId,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/start-test'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(testAttempt.toJson()),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {},
      );
    } catch (e) {
      // TODO: show showSnackBar after backend implementation and delete onSuccess
      // showSnackBar(context, e.toString());
    }
  }
}
