import 'dart:async';

import 'package:flutter/material.dart';

import '../../global_variables.dart';
import '../../local_storage/storage_service.dart';
import '../../utils/service_locator.dart';
import '../auth/ui/sign_up_screen.dart';
import '../dashboard/ui/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appPreferences = serviceLocator<LocalPreferences>();

  @override
  void initState() {
    super.initState();

    Completer<String> timerCompleter = Completer();

    Timer(const Duration(seconds: 3), () async {
      String token = await appPreferences.getAuthToken();
      timerCompleter.complete(token);
    });

    timerCompleter.future.then((token) {
      if (token.isNotEmpty) {
        GlobalVariables.authToken = token;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image.asset('assets/images/logo.png', height: 150.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
