import 'package:flutter/material.dart';
import 'package:frontend/models/question.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final int currentIndex;
  final int totalQuestions;
  final int? selectedAnswerId;
  final Function(int answerId) onAnswerSelected;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onSubmit;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.currentIndex,
    required this.totalQuestions,
    required this.onAnswerSelected,
    required this.onNext,
    required this.onPrevious,
    required this.onSubmit,
    this.selectedAnswerId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            question.questionText,
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 24.0),
          Expanded(
            child: ListView.builder(
              itemCount: question.answers.length,
              itemBuilder: (context, index) {
                final answer = question.answers[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: selectedAnswerId == answer.answerId
                        ? Colors.blue.shade50
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: RadioListTile<int>(
                    title: Text(
                      answer.answerText,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: answer.answerId,
                    groupValue: selectedAnswerId,
                    onChanged: (int? value) {
                      onAnswerSelected(value!);
                    },
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                  ),
                );
              },
            ),
          ),
          navigationButtons()
        ],
      ),
    );
  }

  Widget navigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: ElevatedButton(
              onPressed: currentIndex > 0 ? onPrevious : null,
              child: const Text("Previous")),
        ),
        currentIndex < totalQuestions - 1
            ? Flexible(
                child: ElevatedButton(
                    onPressed: selectedAnswerId != null ? onNext : null,
                    child: const Text("Next")),
              )
            : Flexible(
                child: ElevatedButton(
                    onPressed: selectedAnswerId != null ? onSubmit : null,
                    child: const Text("Submit")),
              )
      ],
    );
  }
}
