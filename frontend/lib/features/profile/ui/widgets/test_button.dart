import 'package:flutter/material.dart';

class TestButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TestButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              backgroundColor: const Color.fromARGB(255, 116, 92, 130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
            ),
            label: Text(text),
          ),
        ],
      ),
    );
  }
}
