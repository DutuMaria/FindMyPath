import 'package:flutter/material.dart';
import 'package:frontend/features/auth/ui/sign_up_screen.dart';
import 'package:frontend/utils/custom_colors.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //themeMode: ThemeMode.light,
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
      home: const SignUpScreen(),
    );
  }
}
