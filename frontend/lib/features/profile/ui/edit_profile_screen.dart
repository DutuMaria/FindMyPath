import 'package:flutter/material.dart';
import 'package:frontend/features/auth/ui/widgets/custom_text_form_input.dart';
import 'package:frontend/models/user_profile.dart';

import '../../../utils/custom_colors.dart';
import '../../dashboard/ui/widgets/custom_app_bar.dart';
import '../../dashboard/ui/widgets/custom_back_button.dart';
import '../logic/profile_services.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(_updateButtonState);
    lastNameController.addListener(_updateButtonState);
    _fetchUserProfile();
  }

  void _fetchUserProfile() async {
    UserProfile userProfile =
        await ProfileServices().fetchUserProfile(context: context);

    firstNameController.text = userProfile.firstName;
    lastNameController.text = userProfile.lastName;
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty;
    });
  }

  void _updateProfileInfo() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit profile',
        leadingIcon: CustomBackButton(
          callback: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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
                    const Center(
                      child: Icon(
                        color: Color.fromARGB(255, 49, 26, 72),
                        Icons.account_circle,
                        size: 90,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFormInput(
                      controller: firstNameController,
                      hintText: 'First name',
                      labelText: 'First name',
                      prefixIcon: const Icon(Icons.person),
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextFormInput(
                      controller: lastNameController,
                      hintText: 'Last name',
                      labelText: 'Last name',
                      obscureText: false,
                      prefixIcon: const Icon(Icons.person),
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
                      onPressed: isButtonEnabled ? _updateProfileInfo : null,
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
}
