import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionHeader({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Icon(
            color: const Color.fromARGB(255, 49, 26, 72),
            icon,
            size: 40,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 146, 146, 146),
        ),
      ],
    );
  }
}
