import 'package:flutter/material.dart';
import 'package:frontend/features/auth/ui/log_in_screen.dart';
import 'package:frontend/features/auth/ui/sign_up_screen.dart';
import 'package:frontend/features/dashboard/logic/dashboard_service.dart';
import 'package:frontend/features/dashboard/ui/widgets/confirmation_dialog.dart';
import 'package:frontend/features/dashboard/ui/widgets/custom_app_bar.dart';
import 'package:frontend/features/test_attempt/ui/test_info_screen.dart';
import 'package:frontend/global_variables.dart';

import '../../../local_storage/storage_service.dart';
import '../../../utils/service_locator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _deleteAccount() {
    DashboardService().deleteAccount(
      context: context,
      onSuccess: () async {
        await _clearUserData();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
        );
      },
    );
  }

  Future<void> _clearUserData() async {
    final localPreferences = serviceLocator<LocalPreferences>();
    await localPreferences.clearData();
    GlobalVariables.authToken = '';
  }

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
                await _clearUserData();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogInScreen(),
                  ),
                );
              },
              child: const Text('Log out'),
            ),
            TextButton(
              onPressed: () {
                showDeleteAccountConfirmationDialog(
                  context,
                  'Delete Account',
                  'Are you sure you want to delete your account?',
                  () {
                    _deleteAccount();
                  },
                );
              },
              child: const Text('Delete account'),
            ),
          ],
        ),
      ),
    );
  }
}
