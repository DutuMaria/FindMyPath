import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/local_storage/storage_service.dart';
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
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.serverUrl}/test-attempts/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
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

  void finishTestAttempt({
    required BuildContext context,
    required String testId,
    required int testRating,
    required int experienceRating,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();

    final rating = jsonEncode({
      "testRating": testRating,
      "experienceRating": experienceRating,
    });

    try {
      http.Response res = await http.put(
        Uri.parse('${GlobalVariables.serverUrl}/test-attempts/$testId'),
        body: rating,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
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

  Future<bool> hasTestAttemptInProgress({
    required BuildContext context,
    required String userId,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();
    bool hasTestAttemptInProgress = false;

    try {
      http.Response res = await http.get(
        Uri.parse(
            '${GlobalVariables.serverUrl}/test-attempts/$userId/has-incomplete-test'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {
          hasTestAttemptInProgress = jsonDecode(res.body);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return hasTestAttemptInProgress;
  }
}
