import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/models/auth.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/utils/error_handling.dart';

class AuthService {
  final String uri = 'http://192.168.80.43:8080/api';

  Future<void> registerUser({
    required BuildContext context,
    required RegisterRequest model,
    required VoidCallback onSuccess,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/auth/register'),
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
    } catch (e) {}
  }

  Future<void> loginUser({
    required BuildContext context,
    required LoginRequest model,
    required VoidCallback onSuccess,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(model.toJson()),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {},
      );
    } catch (e) {
      // Handle error (e.g., showSnackBar)
    }
  }
}
