import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/models/auth.dart';
import 'package:frontend/models/sum_of_ratings.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/utils/error_handling.dart';

import '../../../global_variables.dart';
import '../../../local_storage/storage_service.dart';
import '../../../utils/service_locator.dart';

class AuthService {
  Future<void> loginUser({
    required BuildContext context,
    required LoginRequest model,
    required VoidCallback onSuccess,
  }) async {
    final localPreferences = serviceLocator<LocalPreferences>();

    try {
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.serverUrl}/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () async {
          final decodedBody = jsonDecode(res.body);
          final LoginResponse jsonResponse =
              LoginResponse.fromJson(decodedBody);

          final token = jsonResponse.token;
          final userId = jsonResponse.userId;

          await localPreferences.saveAuthToken(token);
          await localPreferences.saveUserId(userId);

          GlobalVariables.authToken = token;
          GlobalVariables.userId = userId;

          onSuccess();
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> registerUser({
    required BuildContext context,
    required RegisterRequest model,
    required VoidCallback onSuccess,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.serverUrl}/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: onSuccess,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> saveQuestions({
    required BuildContext context,
  }) async {
    final localPreferences = serviceLocator<LocalPreferences>();
    String token = await localPreferences.getAuthToken();

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
          onSucces: () async {
            await localPreferences.saveQuestions(res.body);
            print("res.body question from login: ${res.body}");
          });
    } catch (e) {
      //TODO delete snackbar
      print("$e from login questions");
    }
  }

  Future<void> saveUserInfo({
    required BuildContext context,
  }) async {
    final localPreferences = serviceLocator<LocalPreferences>();
    String token = await localPreferences.getAuthToken();

    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.serverUrl}/user/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () async {
            await localPreferences.saveUserInfo(res.body);
            print("res.body user info from login: ${res.body}");
          });
    } catch (e) {
      //TODO delete snackbar
      print("$e from login user info");
    }
  }

  Future<void> saveUserTests({
    required BuildContext context,
  }) async {
    final localPreferences = serviceLocator<LocalPreferences>();
    String token = await localPreferences.getAuthToken();

    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.serverUrl}/user/test-history'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () async {
            await localPreferences.saveUserTests(res.body);
            print("res.body user tests from login: ${res.body}");
          });
    } catch (e) {
      //TODO delete snackbar
      print("$e from login user tests");
    }
  }

  Future<void> saveDefaultTest({
    required BuildContext context,
  }) async {
    final localPreferences = serviceLocator<LocalPreferences>();
    String body = '''
[
    {
        "careerId": 1,
        "title": "Software Engineer",
        "description": "Develops, tests, and maintains software applications for various platforms.",
        "industry": "Technology",
        "salaryRange": "\$80,000 - \$150,000",
        "experienceLevel": "Mid-Level",
        "requiredSoftSkills": null,
        "requiredHardSkills": null
    },
    {
        "careerId": 3,
        "title": "Financial Analyst",
        "description": "Analyzes financial data to help companies make investment and business decisions.",
        "industry": "Finance",
        "salaryRange": "\$60,000 - \$110,000\n",
        "experienceLevel": "Mid-Level",
        "requiredSoftSkills": null,
        "requiredHardSkills": null
    },
    {
        "careerId": 4,
        "title": "Journalist",
        "description": "Researches and writes news stories for print, online, or broadcast media.",
        "industry": "Media / Journalism",
        "salaryRange": "\$40,000 - \$75,000",
        "experienceLevel": "Mid-Level",
        "requiredSoftSkills": null,
        "requiredHardSkills": null
    },
    {
        "careerId": 5,
        "title": "Travel Consultant",
        "description": "Advises clients on travel options, bookings, and personalized itineraries.",
        "industry": "Travel / Hospitality",
        "salaryRange": "\$45,000 - \$75,000",
        "experienceLevel": "Mid-Level",
        "requiredSoftSkills": null,
        "requiredHardSkills": null
    },
    {
        "careerId": 6,
        "title": "Game Developer",
        "description": "Designs, develops, and programs video games across platforms, working on gameplay mechanics, graphics, and interactive elements.",
        "industry": "Video Games / Entertainment",
        "salaryRange": "\$50,000 - \$120,000",
        "experienceLevel": "Mid-Level",
        "requiredSoftSkills": null,
        "requiredHardSkills": null
    }
]
''';

    await localPreferences.saveTestResults(body);
    print("res.body default test from SP");
  }

  Future<SumOfRatings?> saveRatingsSummary({
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
        onSucces: () async {
          await appPreferences.saveRatingsSummary(res.body);
          print("res.body ratings summary from login: ${res.body}");
        },
      );
    } catch (e) {
      print("$e from login ratings summary");
    }

    return ratings;
  }
}
