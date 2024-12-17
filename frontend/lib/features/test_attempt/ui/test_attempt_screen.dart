import 'package:flutter/material.dart';
import 'package:frontend/features/admin/logic/admin_services.dart';
import 'package:frontend/features/test_attempt/logic/test_attempt_services.dart';
import 'package:frontend/global_variables.dart';
import 'package:frontend/local_storage/storage_service.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/features/test_attempt/ui/widgets/question_screen.dart';
import 'package:frontend/utils/service_locator.dart';

class TestAttemptScreen extends StatefulWidget {
  const TestAttemptScreen({super.key, required this.answers});

  final Map<int, int> answers;

  @override
  State<TestAttemptScreen> createState() => _TestAttemptScreenState();
}

class _TestAttemptScreenState extends State<TestAttemptScreen> {
  final TestAttemptServices testAttemptServices = TestAttemptServices();
  final AdminServices adminServices = AdminServices();
  final appPreferences = serviceLocator<LocalPreferences>();
  late final PageController _pageController;

  List<Question> questionList = [];
  int _currentIndex = 0;
  Map<int, int> userAnswers = {}; // questionId -> answerId
  String userId =
      "fcf0b46d-2efc-4cc6-88b7-1b15effe0eee"; // Simulating user ID for ratonescu26@gmail.com

  @override
  void initState() {
    super.initState();
    fetchQuestions();

    if (widget.answers.isEmpty) {
      startTest();
    } else {
      userAnswers = widget.answers;
      _currentIndex = widget.answers.length - 1;
    }
    _pageController = PageController(initialPage: _currentIndex);
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
          setState(() {});
        },
        physics:
            const NeverScrollableScrollPhysics(), // Disable swipe navigation
        itemCount: questionList.length,
        itemBuilder: (context, _) {
          return QuestionScreen(
            question: questionList[_currentIndex],
            currentIndex: _currentIndex,
            totalQuestions: questionList.length,
            selectedAnswerId:
                userAnswers[questionList[_currentIndex].questionId],
            onAnswerSelected: (answerId) {
              _onAnswerSelected(
                  questionList[_currentIndex].questionId, answerId);
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
    testAttemptServices.startTestAttempt(
      context: context,
      userId: userId,
    );
  }

  void _onAnswerSelected(int questionId, int answerId) {
    setState(() {
      userAnswers[questionId] = answerId;
      appPreferences.saveUserAnswers(userAnswers);
    });
  }

  void _nextQuestion() {
    if (_currentIndex < questionList.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _previousQuestion() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Future<bool> _hasTestAttemptInProgress() async {
    bool hasTestAttemptInProgress =
        await testAttemptServices.hasTestAttemptInProgress(
      context: context,
      userId: userId,
    );

    return hasTestAttemptInProgress;
  }

  void _submitTest() async {
    appPreferences.clearUserAnswers();
    Navigator.of(context).pop();

    // TODO: use actual id and ratings
    testAttemptServices.finishTestAttempt(
      context: context,
      testId: "24",
      testRating: 2,
      experienceRating: 2,
    );
  }
}
