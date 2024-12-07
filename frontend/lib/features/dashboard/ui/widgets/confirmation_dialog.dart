import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showDeleteAccountConfirmationDialog(
  BuildContext context,
  String title,
  String message,
  VoidCallback callback,
) async {
  if (Platform.isAndroid) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            physics: Platform.isAndroid
                ? const ClampingScrollPhysics()
                : const BouncingScrollPhysics(),
            child: Text(message),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                callback();
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  } else {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            physics: Platform.isAndroid
                ? const ClampingScrollPhysics()
                : const BouncingScrollPhysics(),
            child: Text(message),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                callback();
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
