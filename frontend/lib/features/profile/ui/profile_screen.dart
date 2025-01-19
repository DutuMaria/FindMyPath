import 'package:flutter/material.dart';
import 'package:frontend/features/profile/ui/widgets/education_tile.dart';
import 'package:frontend/features/profile/ui/widgets/generate_cv.dart';
import 'package:frontend/features/profile/ui/widgets/section_header.dart';
import 'package:frontend/features/profile/ui/widgets/test_history_tile.dart';
import 'package:frontend/features/profile/ui/widgets/personal_info_tile.dart';
import 'package:frontend/features/profile/logic/profile_services.dart';
import 'package:frontend/models/user_profile.dart';
import 'package:frontend/models/user_test.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileServices profileServices = ProfileServices();
  UserProfile userProfile = UserProfile(email: '', firstName: '', lastName: '');
  List<UserTest> userTests = [];

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
    fetchUserTests();
  }

  fetchUserProfile() async {
    userProfile = await profileServices.fetchUserProfile(context: context);
    if (mounted) setState(() {});
  }

  fetchUserTests() async {
    userTests = await profileServices.fetchUserTests(context: context);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: '',
      //   leadingIcon: CustomBackButton(
      //     callback: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Icon(
                    color: Color.fromRGBO(49, 26, 72, 1),
                    Icons.account_circle,
                    size: 90,
                  )),
                  GenerateCV(userProfile: userProfile),
                  const SizedBox(
                    height: 10,
                  ),
                  const SectionHeader(
                      title: 'Personal Info', icon: Icons.contact_page),
                  PersonalInfoTile(
                      firstName: userProfile.firstName,
                      lastName: userProfile.lastName,
                      email: userProfile.email),
                  const SectionHeader(
                      title: 'Test History', icon: Icons.assignment),
                  TestHistoryTile(userTests: userTests),
                  const SectionHeader(title: 'Education', icon: Icons.school),
                  EducationTile(educationList: userProfile.educationList)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
