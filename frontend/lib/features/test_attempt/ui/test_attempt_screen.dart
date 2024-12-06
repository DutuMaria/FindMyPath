import 'package:flutter/material.dart';
import 'package:frontend/features/admin/logic/admin_services.dart';
import 'package:frontend/features/test_attempt/logic/test_attempt_services.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/models/test_attempt_answers.dart';
import 'package:frontend/features/test_attempt/ui/widgets/question_screen.dart';

class TestAttemptScreen extends StatefulWidget {
  const TestAttemptScreen({super.key});

  @override
  State<TestAttemptScreen> createState() => _TestAttemptScreenState();
}

class _TestAttemptScreenState extends State<TestAttemptScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  Map<int, int> userAnswers = {}; // questionId -> answerId

  int currentTestAttemptId = 1; // Simulating test attempt ID

  String userId = "abc"; // Simulating user ID

  final TestAttemptServices testAttemptServices = TestAttemptServices();
  final AdminServices adminServices = AdminServices();
  List<Question> questionList = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
    startTest();
  }

  @override
  Widget build(BuildContext context) {
    if (questionList.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz App')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentIndex + 1} of ${questionList.length}'),
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics:
            const NeverScrollableScrollPhysics(), // Disable swipe navigation
        itemCount: questionList.length,
        itemBuilder: (context, index) {
          return QuestionScreen(
            question: questionList[index],
            currentIndex: index,
            totalQuestions: questionList.length,
            selectedAnswerId: userAnswers[questionList[index].questionId],
            onAnswerSelected: (answerId) {
              _onAnswerSelected(questionList[index].questionId, answerId);
            },
            onNext: _nextQuestion,
            onPrevious: _previousQuestion,
            onSubmit: _submitTest,
          );
        },
      ),
    );
  }

  fetchQuestions() async {
    questionList = await adminServices.fetchAllQuestions(context: context);
    if (mounted) setState(() {});
  }

  void startTest() {
    testAttemptServices.startTestAttempt(context: context, userId: userId);
  }

  void _onAnswerSelected(int questionId, int answerId) {
    setState(() {
      userAnswers[questionId] = answerId;
    });

    // Simulate saving to 'test_attempt_answers' table
    TestAttemptAnswers answer = TestAttemptAnswers(
      testAttemptId: currentTestAttemptId,
      answerId: answerId,
    );
    _saveAnswerToDatabase(answer);
  }

  void _saveAnswerToDatabase(TestAttemptAnswers answer) {
    // Implement database save logic here
    // For now, we'll just print to console
    print(
        'Saved Answer: TestAttemptId=${answer.testAttemptId}, AnswerId=${answer.answerId}');
  }

  void _nextQuestion() {
    if (_currentIndex < questionList.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _previousQuestion() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _submitTest() {
    // Handle test submission logic
    print('Test Submitted');
    print('User Answers: $userAnswers');
    // Navigate to results page or display a summary
  }
}
