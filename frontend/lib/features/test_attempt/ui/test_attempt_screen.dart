// test_page.dart
import 'package:flutter/material.dart';
import 'package:frontend/features/test_attempt/logic/test_attempt_services.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/features/test_attempt/ui/widgets/question_screen.dart';

class TestAttemptScreen extends StatefulWidget {
  const TestAttemptScreen({super.key});

  @override
  State<TestAttemptScreen> createState() => _TestAttemptScreenState();
}

class _TestAttemptScreenState extends State<TestAttemptScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Sample data
  List<Question> questions = [];
  Map<int, int> userAnswers = {}; // questionId -> answerId

  int currentTestAttemptId = 1; // Simulating test attempt ID
  int userId = 1; // Simulating user ID

  TestAttemptServices testAttemptServices = TestAttemptServices();

  @override
  void initState() {
    super.initState();
    questions = testAttemptServices.loadQuestions();
    _startTest();
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz App')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentIndex + 1} of ${questions.length}'),
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
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return QuestionScreen(
            question: questions[index],
            currentIndex: index,
            totalQuestions: questions.length,
            selectedAnswerId: userAnswers[questions[index].questionId],
            onAnswerSelected: (answerId) {
              _onAnswerSelected(questions[index].questionId, answerId);
            },
            onNext: _nextQuestion,
            onPrevious: _previousQuestion,
            onSubmit: _submitTest,
          );
        },
      ),
    );
  }

  void _startTest() {
    // Simulate creating a new test attempt
    // In a real app, insert into 'test_attempt' table and get 'test_attempt_id'
    currentTestAttemptId = DateTime.now().millisecondsSinceEpoch;
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
    if (_currentIndex < questions.length - 1) {
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
