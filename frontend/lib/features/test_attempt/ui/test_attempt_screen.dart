import 'package:flutter/material.dart';
import 'package:frontend/features/admin/logic/admin_services.dart';
import 'package:frontend/features/test_attempt/logic/test_attempt_services.dart';
import 'package:frontend/features/test_attempt/ui/widgets/rating.dart';
import 'package:frontend/local_storage/storage_service.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/features/test_attempt/ui/widgets/question_screen.dart';
import 'package:frontend/models/ratings.dart';
import 'package:frontend/utils/custom_colors.dart';
import 'package:frontend/utils/service_locator.dart';

class TestAttemptScreen extends StatefulWidget {
  const TestAttemptScreen({
    super.key,
    required this.answers,
    required this.userId,
  });

  final Map<int, int> answers;
  final String userId;

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
  int testId = -1;

  @override
  void initState() {
    super.initState();
    fetchQuestions();

    if (widget.answers.isEmpty) {
      startTest(widget.userId);
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
        backgroundColor: CustomColors.primaryPink,
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
            onSkip: () => _skipQuestion(questionList[_currentIndex].questionId),
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

  void startTest(String userId) async {
    testId = await testAttemptServices.startTestAttempt(
      context: context,
      userId: userId,
    );
    print(" aaaa $testId");
  }

  void _onAnswerSelected(int questionId, int answerId) {
    setState(() {
      userAnswers[questionId] = answerId;
      appPreferences.saveUserAnswers(userAnswers);
    });
  }

  void _skipQuestion(int questionId) {
    setState(() {
      userAnswers[questionId] = -1;
      appPreferences.saveUserAnswers(userAnswers);
    });
    _nextQuestion();
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
      userId: widget.userId,
    );

    return hasTestAttemptInProgress;
  }

  void _submitTest() async {
    testAttemptServices.submitTestAttempt(
      context: context,
      testId: testId,
      answersIdList: userAnswers.values.where((x) => x > 0).toList(),
    );

    // TODO: update test attempt with ratings

    await showRatingDialog(
      context,
      (experienceRating, contentRating) {
        print('Experience Rating: $experienceRating');
        print('Test Content Rating: $contentRating');

        testAttemptServices.rateTestAttempt(
          context: context,
          testId: testId,
          ratings: Ratings(
            experienceRating: experienceRating,
            contentRating: contentRating,
          ),
        );
      },
    );

    appPreferences.clearUserAnswers();
    Navigator.of(context).pop();
  }
}
