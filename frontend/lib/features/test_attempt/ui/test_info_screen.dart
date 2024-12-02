import 'package:flutter/material.dart';
import 'package:frontend/features/dashboard/ui/widgets/custom_app_bar.dart';
import 'package:frontend/features/dashboard/ui/widgets/custom_back_button.dart';
import 'package:frontend/features/test_attempt/ui/test_attempt_screen.dart';
import 'package:frontend/features/test_attempt/ui/widgets/custom_info_row.dart';

class TestInfoScreen extends StatelessWidget {
  const TestInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Test Info',
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomInfoRow(
                    icon: Icons.search,
                    title: 'Purpose',
                    description: 'Identifying the ideal career path for you.',
                  ),
                  const CustomInfoRow(
                    icon: Icons.access_time,
                    title: 'Estimated Duration',
                    description: '1 hour.',
                  ),
                  const CustomInfoRow(
                    icon: Icons.question_answer,
                    title: 'Question Type',
                    description: 'Multiple-choice test - 30 questions.',
                  ),
                  const CustomInfoRow(
                    icon: Icons.lightbulb,
                    title: 'Instructions',
                    description: '- Answer each question honestly.\n'
                        '- Choose the option that suits you best.\n'
                        '- Prepare in a distraction-free environment.',
                  ),
                  const CustomInfoRow(
                    icon: Icons.bar_chart,
                    title: 'Results',
                    description:
                        'Personalized suggestions for your professional future!',
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TestAttemptScreen(),
                          ),
                        );
                      },
                      child: const Text('Start Test'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
