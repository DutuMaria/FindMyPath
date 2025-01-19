import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/features/admin/ui/admin_home.dart';
import 'package:frontend/features/auth/ui/log_in_screen.dart';
import 'package:frontend/features/auth/ui/sign_up_screen.dart';
import 'package:frontend/features/splash_screen/splash_screen.dart';
import 'package:frontend/utils/custom_colors.dart';
import 'package:frontend/utils/service_locator.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      setupServiceLocator();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]).then(
        (_) => runApp(
          const QuizApp(),
        ),
      );
    },
    (error, stack) {},
  );
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
      home: const SplashScreen(),
    );
  }
}
