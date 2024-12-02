import 'package:flutter/material.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback callback;

  const CustomBackButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return TapDebouncer(
      cooldown: const Duration(seconds: 1),
      onTap: () async {
        callback();
      },
      builder: (BuildContext context, Future<void> Function()? onTap) {
        return IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
