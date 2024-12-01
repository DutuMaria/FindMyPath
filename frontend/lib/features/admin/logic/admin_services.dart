import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/features/test_attempt/logic/test_attempt_services.dart';
import 'package:frontend/models/answer.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/utils/error_handling.dart';
import 'package:http/http.dart' as http;

class AdminServices {
  Future<List<Question>> fetchAllQuestions({
    required BuildContext context,
  }) async {
    List<Question> questionsList = [];

    try {
      http.Response res = await http.get(
        Uri.parse('$uri/all-questions'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              questionsList.add(
                Question.fromJson(jsonDecode(res.body)[i]),
              );
            }
          });
    } catch (e) {
      // TODO: show showSnackBar after backend implementation
      // showSnackBar(context, e.toString());
    }

// TODO: change with actual implementation
//return questionsList;
    TestAttemptServices testAttemptServices = TestAttemptServices();
    return testAttemptServices.loadQuestions();
  }

  void deleteQuestion({
    required BuildContext context,
    required Question question,
    required VoidCallback onSuccess,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-question'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'id': question.questionId}),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            onSuccess();
          });
    } catch (e) {
      // TODO: show showSnackBar after backend implementation and delete onSuccess
      // showSnackBar(context, e.toString());
      onSuccess();
    }
  }

  void saveNewQuestion({
    required BuildContext context,
    required String questionText,
    required List<TextEditingController> answersControllerList,
    required VoidCallback onSucces,
  }) async {
    try {
      List<Answer> answerList = [];

      answersControllerList.asMap().forEach((index, controller) {
        Answer answer = Answer(
          // TODO: not sure if answerId should be unique. If yes, should be processed by backend
          answerId: index + 1,
          answerText: controller.text,
          questionId: 0,
        );
        answerList.add(answer);
      });

      Question question = Question(
        questionId: 0,
        questionText: questionText,
        answers: answerList,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/save-question'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(question.toJson()),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            onSucces();
          });
    } catch (e) {
      // TODO: show showSnackBar after backend implementation and delete onSuccess
      // showSnackBar(context, e.toString());
      onSucces();
    }
  }

  void editExistingQuestion({
    required BuildContext context,
    required int questionId,
    required String questionText,
    required List<TextEditingController> answersControllerList,
    required VoidCallback onSucces,
  }) async {
    try {
      List<Answer> answerList = [];

      answersControllerList.asMap().forEach((index, controller) {
        Answer answer = Answer(
          // TODO: not sure if answerId should be unique. If yes, should be processed by backend
          answerId: index + 1,
          answerText: controller.text,
          questionId: questionId,
        );
        answerList.add(answer);
      });

      Question question = Question(
        questionId: questionId,
        questionText: questionText,
        answers: answerList,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/edit-question'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(question.toJson()),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            onSucces();
          });
    } catch (e) {
      // TODO: show showSnackBar after backend implementation
      // showSnackBar(context, e.toString());
      onSucces();
    }
  }
}
