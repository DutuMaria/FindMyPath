import 'package:flutter/material.dart';
import 'package:frontend/features/auth/ui/log_in_screen.dart';
import 'package:frontend/features/auth/ui/sign_up_screen.dart';
import 'package:frontend/features/dashboard/logic/dashboard_service.dart';
import 'package:frontend/features/dashboard/ui/widgets/confirmation_dialog.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/local_storage/storage_service.dart';
import 'package:frontend/utils/custom_colors.dart';
import 'package:frontend/utils/logo_image.dart';
import 'package:frontend/utils/service_locator.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
    await localPreferences.clearUserAnswers();
    GlobalVariables.authToken = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Are you looking to leave?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.primaryPink,
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 2),
                        blurRadius: 3.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
              const LogoImage(
                source:
                    "https://wwohqlpxrsvgdyijgmgc.supabase.co/storage/v1/object/public/images/image_with_new_background.png?t=2025-01-19T00%3A20%3A54.259Z",
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  await _clearUserData();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: CustomColors.primaryPink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  showDeleteAccountConfirmationDialog(
                    context,
                    'Delete Account',
                    'Are you sure you want to delete your account? This action cannot be undone.',
                    () {
                      _deleteAccount();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.delete, color: Colors.white),
                label: const Text(
                  'Delete Account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
