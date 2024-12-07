import 'package:flutter/material.dart';
import 'package:frontend/features/auth/ui/log_in_screen.dart';
import 'package:frontend/features/auth/ui/sign_up_screen.dart';
import 'package:frontend/features/dashboard/ui/widgets/custom_app_bar.dart';
import 'package:frontend/features/test_attempt/ui/test_info_screen.dart';
import 'package:frontend/global_variables.dart';

import '../../../local_storage/storage_service.dart';
import '../../../utils/service_locator.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Dashboard',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestInfoScreen(),
                  ),
                );
              },
              child: const Text('Start Test'),
            ),
            TextButton(
              onPressed: () async {
                // TODO + request backend
                await clearUserData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: const Text('Delete account'),
            ),
            TextButton(
              onPressed: () async {
                await clearUserData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogInScreen(),
                  ),
                );
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> clearUserData() async {
    final localPreferences = serviceLocator<LocalPreferences>();
    await localPreferences.clearData();
    GlobalVariables.authToken = '';
  }
}
