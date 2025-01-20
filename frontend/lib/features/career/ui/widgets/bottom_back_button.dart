import 'package:flutter/material.dart';

class BottomBackButton extends StatefulWidget {
  const BottomBackButton({super.key});

  @override
  State<StatefulWidget> createState() => _BottomBackButton();
}

class _BottomBackButton extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 43, 20, 64),
      padding: const EdgeInsets.symmetric(horizontal: 140.0, vertical: 5.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(30, 30),
          backgroundColor: const Color.fromARGB(255, 43, 20, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text('Back'),
      ),
    );
  }
}
