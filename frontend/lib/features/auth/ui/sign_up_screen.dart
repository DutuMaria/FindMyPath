import 'package:flutter/material.dart';
import 'package:frontend/features/auth/ui/widgets/custom_text_form_input.dart';
import 'package:frontend/utils/custom_colors.dart';
import 'package:frontend/utils/logo_image.dart';
import '../logic/auth_service.dart';
import 'log_in_screen.dart';
import 'package:frontend/models/auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    firstNameController.addListener(_updateButtonState);
    lastNameController.addListener(_updateButtonState);
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  void _registerUser() {
    final registerRequest = RegisterRequest(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    AuthService().registerUser(
      context: context,
      model: registerRequest,
      onSuccess: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInScreen(),
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoImage(),
                    const SizedBox(height: 20.0),
                    CustomTextFormInput(
                      controller: firstNameController,
                      hintText: 'First Name',
                      labelText: 'First Name',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextFormInput(
                      controller: lastNameController,
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 20.0),
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
                    const SizedBox(height: 25.0),
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
                      onPressed: isButtonEnabled ? _registerUser : null,
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 20.0),
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ),
                        );
                      },
                      child: const Text('Log in'),
                    ),
                  ],
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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
