import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/utils/error_handling.dart';

import '../../../global_variables.dart';

class DashboardService {
  Future<void> deleteAccount({
    required BuildContext context,
    required VoidCallback onSuccess,
  }) async {
    try {
      http.Response res = await http.delete(
        Uri.parse('${GlobalVariables.serverUrl}/user/delete'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${GlobalVariables.authToken}',
        },
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
}
