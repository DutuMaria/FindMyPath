import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/features/test_attempt/logic/test_attempt_services.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/local_storage/storage_service.dart';
import 'package:frontend/models/answer.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/utils/error_handling.dart';
import 'package:frontend/utils/service_locator.dart';
import 'package:http/http.dart' as http;

class AdminServices {
  Future<List<Question>> fetchAllQuestions({
    required BuildContext context,
  }) async {
    List<Question> questionsList = [];
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();
    print(token);

    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.serverUrl}/questions/answer-list'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            final decodedBody = jsonDecode(res.body) as List;
            questionsList = decodedBody
                .map((question) => Question.fromJson(question))
                .toList();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return questionsList;
  }

  void deleteQuestion({
    required BuildContext context,
    required Question question,
    required VoidCallback onSuccess,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();

    try {
      http.Response res = await http.delete(
        Uri.parse(
            '${GlobalVariables.serverUrl}/questions/${question.questionId}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            onSuccess();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void saveNewQuestion({
    required BuildContext context,
    required String questionText,
    required List<TextEditingController> answersControllerList,
    required VoidCallback onSucces,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();

    try {
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.serverUrl}/questions'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(questionText),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () async {
            final decodedBody = Question.fromJson(jsonDecode(res.body));

            List<String> answerList = [];

            answersControllerList.asMap().forEach((index, controller) {
              answerList.add(controller.text);
            });

            List<Map<String, String>> answerDtos =
                answerList.map((text) => {"answerText": text}).toList();

            http.Response res2 = await http.post(
              Uri.parse(
                  '${GlobalVariables.serverUrl}/answers/add-answers/${decodedBody.questionId}'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token'
              },
              body: jsonEncode(answerDtos),
            );

            httpErrorHandle(
                response: res2,
                context: context,
                onSucces: () {
                  onSucces();
                });
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void editExistingQuestion({
    required BuildContext context,
    required Question question,
    required String newQuestionText,
    required List<TextEditingController> newAnswersControllerList,
    required VoidCallback onSucces,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();

    try {
      List<Answer> answerList = [];

      newAnswersControllerList.asMap().forEach((index, controller) {
        Answer answer = Answer(
          answerId: question.answers!.elementAt(index).answerId,
          answerText: controller.text,
        );
        answerList.add(answer);
      });

      Question updatedQuestion = Question(
        questionId: question.questionId,
        questionText: newQuestionText,
        answers: answerList,
      );

      http.Response res = await http.put(
        Uri.parse('${GlobalVariables.serverUrl}/answers/update-answers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(updatedQuestion.toJson()),
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            onSucces();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      log(e.toString());
    }
  }
}
