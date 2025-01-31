import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/local_storage/storage_service.dart';
import 'package:frontend/models/user_profile.dart';
import 'package:frontend/models/user_test.dart';
import 'package:frontend/utils/error_handling.dart';
import 'package:frontend/utils/service_locator.dart';
import 'package:http/http.dart' as http;

class ProfileServices {
  Future<UserProfile> fetchUserProfile({
    required BuildContext context,
  }) async {
    UserProfile userProfile = UserProfile(
      email: '',
      firstName: '',
      lastName: '',
      educationList: [],
    );
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();

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
          onSucces: () {
            final decodedBody = jsonDecode(res.body) as Map<String, dynamic>;
            userProfile = UserProfile.fromJson(decodedBody);
          });

      if (userProfile.lastName.isEmpty) {
        final body = await appPreferences.getUserInfo();
        final decodedBody = jsonDecode(body) as Map<String, dynamic>;
        userProfile = UserProfile.fromJson(decodedBody);
        print(userProfile.lastName + " last name loaded from SP");
      }
    } catch (e) {
      final body = await appPreferences.getUserInfo();
      final decodedBody = jsonDecode(body) as Map<String, dynamic>;
      userProfile = UserProfile.fromJson(decodedBody);

      print(userProfile.lastName + " last name loaded from SP catch");
      print(e.toString());
    }

    return userProfile;
  }

  Future<List<UserTest>> fetchUserTests({
    required BuildContext context,
  }) async {
    List<UserTest> userTests = [];
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();

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
          onSucces: () {
            final decodedBody = jsonDecode(res.body) as List;
            userTests =
                decodedBody.map((test) => UserTest.fromJson(test)).toList();
          });

      if (userTests.isEmpty) {
        final body = await appPreferences.getUserTests();
        final decodedBody = jsonDecode(body) as List;
        userTests = decodedBody.map((test) => UserTest.fromJson(test)).toList();
        print("user tests loaded from SP");
      }
    } catch (e) {
      final body = await appPreferences.getUserTests();
      final decodedBody = jsonDecode(body) as List;
      userTests = decodedBody.map((test) => UserTest.fromJson(test)).toList();
      print("user tests loaded from SP catch");
    }

    return userTests;
  }
}
