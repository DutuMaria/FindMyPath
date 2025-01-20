import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/local_storage/storage_service.dart';
import 'package:frontend/models/ratings.dart';
import 'package:frontend/models/sum_of_ratings.dart';
import 'package:frontend/utils/error_handling.dart';
import 'package:frontend/utils/service_locator.dart';
import 'package:http/http.dart' as http;

class TestAttemptServices {
  Future<int> startTestAttempt({
    required BuildContext context,
    required String userId,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();
    int testAttemptId = -1;

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
        onSucces: () {
          Map<String, dynamic> responseData = jsonDecode(res.body);
          testAttemptId = responseData['testAttemptId'];
        },
      );
    } catch (e) {
      print(e.toString());
    }

    print("$testAttemptId from startTest");
    return testAttemptId;
  }

  void submitTestAttempt({
    required BuildContext context,
    required int testId,
    required List<int> answersIdList,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();
    if (testId == -1) {
      testId = 178;
    }
    print(answersIdList);
    print("$testId from submitTest");
    try {
      http.Response res = await http.post(
        Uri.parse(
            '${GlobalVariables.serverUrl}/test-attempts/$testId/finish-test'),
        body: jsonEncode({
          'answerIds': answersIdList,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {
          print(res.statusCode);
          print(res.body);
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void rateTestAttempt({
    required BuildContext context,
    required int testId,
    required Ratings ratings,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();
    if (testId == -1) {
      testId = 178;
    }
    print("$testId from submitTest");

    try {
      http.Response res = await http.put(
        Uri.parse('${GlobalVariables.serverUrl}/test-attempts/$testId'),
        body: jsonEncode(ratings),
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
      print(e.toString());
    }
  }

  Future<SumOfRatings?> getRatingsSummary({
    required BuildContext context,
  }) async {
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();
    SumOfRatings? ratings;

    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.serverUrl}/test-attempts/ratings-summary'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {
          final decodedBody = jsonDecode(res.body);
          ratings = SumOfRatings.fromJson(decodedBody);
        },
      );

      if (ratings == null) {
        final body = await appPreferences.getRatingsSummary();
        final decodedBody = jsonDecode(body);
        ratings = SumOfRatings.fromJson(decodedBody);
        print("ratings summary loaded from SP");
      }
    } catch (e) {
      final body = await appPreferences.getRatingsSummary();
      final decodedBody = jsonDecode(body);
      ratings = SumOfRatings.fromJson(decodedBody);
      print("ratings summary loaded from SP catch");
    }

    return ratings;
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
          // TODO check if jsonDecode(res.body) is actually returning a bool
          hasTestAttemptInProgress = jsonDecode(res.body);
        },
      );
    } catch (e) {
      print(e.toString());
    }
    return hasTestAttemptInProgress;
  }
}
