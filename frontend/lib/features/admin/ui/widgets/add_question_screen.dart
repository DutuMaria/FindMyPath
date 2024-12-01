import 'package:flutter/material.dart';
import 'package:frontend/features/admin/logic/admin_services.dart';
import 'package:frontend/models/question.dart';
import 'package:frontend/utils/custom_textfield.dart';
import 'package:frontend/utils/error_handling.dart';

class AddQuestionScreen extends StatefulWidget {
  final VoidCallback fetchQuestions;
  final Question question;

  const AddQuestionScreen({
    super.key,
    required this.question,
    required this.fetchQuestions,
  });

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _questionNameController = TextEditingController();
  final _addQuestionKey = GlobalKey<FormState>();
  final AdminServices adminServices = AdminServices();
  late List<TextEditingController> _answerControllers;

  @override
  void initState() {
    super.initState();
    _questionNameController.text = widget.question.questionText;
    _answerControllers = widget.question.answers
        .map((answer) => TextEditingController(text: answer.answerText))
        .toList();
  }

  @override
  void dispose() {
    super.dispose();
    _questionNameController.dispose();
    for (var controller in _answerControllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Form(
        key: _addQuestionKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _questionNameController,
                  labelText: "Question Name",
                ),
                const SizedBox(height: 60),
                ListView.builder(
                  itemCount: _answerControllers.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: _buildAnswerField(index),
                    );
                  },
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buttonToSaveQuestion(),
                    _buttonToAddAnswerField()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveNewQuestion() {
    if (_addQuestionKey.currentState!.validate()) {
      adminServices.saveNewQuestion(
        context: context,
        questionText: _questionNameController.text,
        answersControllerList: _answerControllers,
        onSucces: () {
          showSnackBar(context, "Question Edited Successfully");
          Navigator.pop(context);
          widget.fetchQuestions();
        },
      );
    }
  }

  void editExistingQuestion() {
    if (_addQuestionKey.currentState!.validate()) {
      adminServices.editExistingQuestion(
        context: context,
        questionId: widget.question.questionId,
        questionText: _questionNameController.text,
        answersControllerList: _answerControllers,
        onSucces: () {
          showSnackBar(context, "Question Saved Successfully");
          Navigator.pop(context);
          widget.fetchQuestions();
        },
      );
    }
  }

  void _addNewAnswerField() {
    setState(() {
      _answerControllers.add(TextEditingController());
    });
  }

  void _removeAnswerField(int index) {
    setState(() {
      _answerControllers.removeAt(index);
    });
  }

  Widget _buttonToSaveQuestion() {
    return ElevatedButton.icon(
      onPressed: widget.question.questionId == 0
          ? saveNewQuestion
          : editExistingQuestion,
      icon: const Icon(Icons.save),
      label: const Text('Save Question'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _buttonToAddAnswerField() {
    return ElevatedButton.icon(
      onPressed: _addNewAnswerField,
      icon: const Icon(Icons.add),
      label: const Text('Add Answer'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _buildAnswerField(int index) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: _answerControllers[index],
            labelText: 'Answer ${index + 1}',
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () => _removeAnswerField(index),
        ),
      ],
    );
  }
}
