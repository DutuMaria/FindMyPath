import 'package:flutter/material.dart';

class TestAttemptResultsHeader extends StatefulWidget {
  const TestAttemptResultsHeader({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _TestAttemptResultsHeader();
}

class _TestAttemptResultsHeader extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Icon(
            color: Color.fromARGB(255, 49, 26, 72),
            Icons.work_outline_rounded,
            size: 40,
          ),
          title: Text(
            "Career Results",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 146, 146, 146),
        ),
      ],
    );
  }
}
