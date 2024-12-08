import 'package:flutter/material.dart';
import 'package:frontend/features/admin/logic/admin_services.dart';
import 'package:frontend/features/admin/ui/widgets/add_question_screen.dart';
import 'package:frontend/features/admin/ui/widgets/question_container.dart';
import 'package:frontend/features/dashboard/ui/widgets/custom_app_bar.dart';
import 'package:frontend/features/dashboard/ui/widgets/custom_back_button.dart';
import 'package:frontend/models/answer.dart';
import 'package:frontend/models/question.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final AdminServices adminServices = AdminServices();
  List<Question> questionList = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Admin Dashboard',
        leadingIcon: CustomBackButton(
          callback: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (questionList.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questionList.length,
                  itemBuilder: (context, index) {
                    return QuestionContainer(
                      questionText: questionList[index].questionText,
                      onEdit: () => goToEditQuestion(questionList[index]),
                      onDelete: () =>
                          deleteQuestion(questionList[index], index),
                    );
                  },
                ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                onPressed: () => goToAddQuestion(
                  Question(
                    questionId: 0,
                    questionText: '',
                    answers: <Answer>[],
                  ),
                ),
                icon: const Icon(Icons.add, size: 24),
                label: const Text('Add question'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  fetchQuestions() async {
    questionList = await adminServices.fetchAllQuestions(context: context);
    if (mounted) setState(() {});
  }

  void deleteQuestion(Question question, int index) {
    adminServices.deleteQuestion(
        context: context,
        question: question,
        onSuccess: () {
          questionList.removeAt(index);
          setState(() {});
        });
  }

  void goToAddQuestion(Question question) {
    // TODO: implement routing using auto_route
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddQuestionScreen(
          question: question,
          fetchQuestions: fetchQuestions,
        ),
      ),
    );
  }

  void goToEditQuestion(Question question) {
    // TODO: implement routing using auto_route
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddQuestionScreen(
          question: question,
          fetchQuestions: fetchQuestions,
        ),
      ),
    );
  }
}
