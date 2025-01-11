import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:frontend/features/profile/logic/profile_services.dart';
import 'package:frontend/features/dashboard/ui/widgets/custom_app_bar.dart';
import 'package:frontend/features/dashboard/ui/widgets/custom_back_button.dart';
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
        appBar: CustomAppBar(
          title: '',
          leadingIcon: CustomBackButton(
            callback: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(children: [
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
                          color: Color.fromARGB(255, 49, 26, 72),
                          Icons.account_circle,
                          size: 90,
                        )),
                        const SizedBox(
                          height: 30,
                        ),
                        const ListTile(
                          leading: Icon(
                            color: Color.fromARGB(255, 49, 26, 72),
                            Icons.contact_page,
                            size: 40,
                          ),
                          title: Text(
                            'Personal Info',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 146, 146, 146),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: ListTile(
                            leading: const Icon(
                              color: Color.fromARGB(255, 49, 26, 72),
                              Icons.person,
                              size: 30,
                            ),
                            title: Text(
                              '${userProfile.firstName} ${userProfile.lastName}',
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: ListTile(
                            leading: const Icon(
                              color: Color.fromARGB(255, 49, 26, 72),
                              Icons.email,
                              size: 30,
                            ),
                            title: Text(
                              userProfile.email,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ListTile(
                          leading: Icon(
                            color: Color.fromARGB(255, 49, 26, 72),
                            Icons.assignment,
                            size: 40,
                          ),
                          title: Text(
                            'Test History',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 146, 146, 146),
                        ),
                        if (userTests.isNotEmpty)
                          for (var test in userTests)
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Card(
                                    color: Colors.white70,
                                    child: ListTile(
                                      title: Text(
                                        'Test Attempt - ${DateFormat('dd MMM yyyy hh:mm a').format(test.attemptDate)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Experience: ${test.experienceRating != null ? '${test.experienceRating}/5' : 'Not Rated'}',
                                          ),
                                          Text(
                                            'Test Content: ${test.testRating != null ? '${test.testRating}/5' : 'Not Rated'}',
                                          ),
                                          Text(
                                            'Complete: ${test.isCompleted ? 'Yes' : 'No'}',
                                          ),
                                        ],
                                      ),
                                    ))),
                        if (userTests.isEmpty)
                          const Center(
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'No test attempts recorded',
                                    style: TextStyle(fontSize: 17),
                                  ))),
                        const SizedBox(
                          height: 20,
                        ),
                        const ListTile(
                          leading: Icon(
                            color: Color.fromARGB(255, 49, 26, 72),
                            Icons.school,
                            size: 40,
                          ),
                          title: Text(
                            'Education',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 146, 146, 146),
                        ),
                        if (userProfile.educationList != null)
                          for (var education in userProfile.educationList!)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Card(
                                color: Colors.white70,
                                child: ListTile(
                                  title: Text(
                                    education.certificate,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Institution: ${education.institution ?? 'Not Available'}'),
                                      Text(
                                          'Completion Date: ${education.completionDate != null ? DateFormat('dd MMMM yyyy').format(education.completionDate!) : 'Not Available'}'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        if (userProfile.educationList == null ||
                            userProfile.educationList!.isEmpty)
                          const Center(
                              child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'No education added',
                                    style: TextStyle(fontSize: 17),
                                  ))),
                      ])))
        ]));
  }
}
