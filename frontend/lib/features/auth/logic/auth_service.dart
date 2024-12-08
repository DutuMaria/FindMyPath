import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/models/auth.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/utils/error_handling.dart';

import '../../../global_variables.dart';
import '../../../local_storage/storage_service.dart';
import '../../../utils/service_locator.dart';

class AuthService {
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
      // Handle error (e.g., showSnackBar)
    }
  }

  Future<void> loginUser({
    required BuildContext context,
    required LoginRequest model,
    required VoidCallback onSuccess,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.serverUrl}/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      print("aa ${res.body}");

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () async {
          final token = res.body;
          final localPreferences = serviceLocator<LocalPreferences>();
          await localPreferences.saveAuthToken(token);
          GlobalVariables.authToken = token;
          onSuccess();
        },
      );
    } catch (e) {
      // Handle error (e.g., showSnackBar)
    }
  }
}
