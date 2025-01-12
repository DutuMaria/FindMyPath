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
      showSnackBar(context, e.toString());
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

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () async {
          final decodedBody = jsonDecode(res.body);
          final LoginResponse jsonResponse =
              LoginResponse.fromJson(decodedBody);

          final token = jsonResponse.token;
          final userId = jsonResponse.userId;

          final localPreferences = serviceLocator<LocalPreferences>();
          await localPreferences.saveAuthToken(token);
          await localPreferences.saveUserId(userId);

          GlobalVariables.authToken = token;
          GlobalVariables.userId = userId;

          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
