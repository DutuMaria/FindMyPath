import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/local_storage/storage_service.dart';
import 'package:frontend/models/career.dart';
import 'package:frontend/utils/error_handling.dart';
import 'package:frontend/utils/service_locator.dart';
import 'package:http/http.dart' as http;

class CareerServices {
  Future<List<Career>> fetchCareerResults({
    required BuildContext context,
    required int testAttemptId,
  }) async {
    List<Career> careers = [];
    final appPreferences = serviceLocator<LocalPreferences>();
    String token = await appPreferences.getAuthToken();

    try {
      http.Response res = await http.post(
        Uri.parse(
            '${GlobalVariables.serverUrl}/test-attempts/process-results/$testAttemptId'),
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
            careers =
                decodedBody.map((career) => Career.fromJson(career)).toList();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return careers;
  }
}
