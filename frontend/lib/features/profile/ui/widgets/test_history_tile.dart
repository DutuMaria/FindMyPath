import 'package:flutter/material.dart';
import 'package:frontend/features/career/ui/career_screen.dart';
import 'package:frontend/features/profile/ui/widgets/test_button.dart';
import 'package:intl/intl.dart';
import 'package:frontend/models/user_test.dart';

class TestHistoryTile extends StatelessWidget {
  final List<UserTest> userTests;

  const TestHistoryTile({
    super.key,
    required this.userTests,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (userTests.isNotEmpty)
          for (var test in userTests)
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                    color: Colors.white70,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                'Test Attempt - ${DateFormat('dd MMM yyyy hh:mm a').format(test.attemptDate)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            ),
                            TestButton(
                              text: test.isCompleted ? 'View' : 'Continue',
                              onPressed: test.isCompleted
                                  ? () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CareerScreen(
                                                testAttemptId:
                                                    test.testAttemptId),
                                          ),
                                        )
                                      }
                                  : () => {},
                            ),
                          ],
                        )
                      ],
                    ))),
        if (userTests.isEmpty)
          const Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'No test attempts recorded',
                    style: TextStyle(fontSize: 17),
                  ))),
      ],
    );
  }
}
