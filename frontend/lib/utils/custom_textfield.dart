import 'package:flutter/material.dart';
import 'package:frontend/utils/custom_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String labelText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: CustomColors.primaryBlue),
        ),
      ),
      controller: controller,
      validator: (val) {
        if (val == null || val.trim().isEmpty) {
          return '$labelText is required';
        }
        return null;
      },
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.next,
    );
  }
}
