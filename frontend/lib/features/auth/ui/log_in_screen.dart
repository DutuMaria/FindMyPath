import 'package:flutter/material.dart';
import 'package:frontend/features/auth/ui/sign_up_screen.dart';
import 'package:frontend/features/auth/ui/widgets/custom_text_form_input.dart';
import 'package:frontend/features/dashboard/ui/dashboard_screen.dart';
import 'package:frontend/features/profile/logic/profile_services.dart';
import 'package:frontend/features/test_attempt/logic/test_attempt_services.dart';
import 'package:frontend/utils/logo_image.dart';

import '../../../models/auth.dart';
import '../../../utils/custom_colors.dart';
import '../logic/auth_service.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  void _loginUser() {
    final loginRequest = LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    );

    AuthService().loginUser(
      context: context,
      model: loginRequest,
      onSuccess: () {
        AuthService().saveQuestions(context: context);
        AuthService().saveUserInfo(context: context);
        AuthService().saveUserTests(context: context);
        AuthService().saveRatingsSummary(context: context);
        AuthService().saveDefaultTest(context: context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      },
    );
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
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LogoImage(),
                      const SizedBox(height: 30.0),
                      CustomTextFormInput(
                        controller: emailController,
                        hintText: 'Email',
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20.0),
                      CustomTextFormInput(
                        controller: passwordController,
                        hintText: 'Password',
                        labelText: 'Password',
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isButtonEnabled
                              ? Colors.blue
                              : CustomColors.primaryBlue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: isButtonEnabled ? _loginUser : null,
                        child: const Text('Log In'),
                      ),
                      const SizedBox(height: 100.0),
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
