import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSucces,
}) {
  switch (response.statusCode) {
    case >= 200 && < 300:
      onSucces();
      break;
    case >= 400 && < 500:
      showSnackBar(context, jsonDecode(response.body));
      break;
    case >= 500 && < 600:
      showSnackBar(context, jsonDecode(response.body));
      break;
    default:
      showSnackBar(context, response.body);
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.red),
      ),
    ),
  );
}
