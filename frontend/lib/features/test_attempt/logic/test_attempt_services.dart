import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/local_storage/storage_service.dart';
import 'package:frontend/models/answer.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/models/test_attempt.dart';
import 'package:frontend/utils/error_handling.dart';
import 'package:frontend/utils/service_locator.dart';
import 'package:http/http.dart' as http;

class TestAttemptServices {
  void startTestAttempt({
    required BuildContext context,
    required String userId,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();

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
        Uri.parse('${GlobalVariables.serverUrl}/admin/start-test'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(testAttempt.toJson()),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {},
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
