import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/features/admin/logic/admin_services.dart';
import 'package:frontend/features/admin/ui/admin_screen.dart';
import 'package:frontend/features/dashboard/ui/user_screen.dart';
import 'package:frontend/utils/logo_image.dart';

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
  final AdminServices adminServices = AdminServices();
  bool isAdmin = false;

  @override
  void initState() {
    super.initState();

    Completer<String> timerCompleter = Completer();

    Timer(const Duration(seconds: 3), () async {
      String token = await appPreferences.getAuthToken();
      GlobalVariables.userId = await appPreferences.getUserId();
      timerCompleter.complete(token);
    });

    timerCompleter.future.then((token) {
      if (token.isNotEmpty) {
        verifyUserRole();
        GlobalVariables.authToken = token;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                isAdmin ? const AdminScreen() : const UserScreen(),
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

  verifyUserRole() async {
    isAdmin = await adminServices.isAdmin(context: context);
    if (mounted) setState(() {});
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
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: LogoImage(),
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
