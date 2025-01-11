import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:frontend/models/education.dart';

class EducationTile extends StatelessWidget {
  final List<Education>? educationList;

  const EducationTile({
    super.key,
    required this.educationList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (educationList != null)
          for (var education in educationList!)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                color: Colors.white70,
                child: ListTile(
                  title: Text(
                    education.certificate,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Institution: ${education.institution ?? 'Not Available'}'),
                      Text(
                          'Completion Date: ${education.completionDate != null ? DateFormat('dd MMMM yyyy').format(education.completionDate!) : 'Not Available'}'),
                    ],
                  ),
                ),
              ),
            ),
        if (educationList == null || educationList!.isEmpty)
          const Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'No education added',
                    style: TextStyle(fontSize: 17),
                  ))),
      ],
    );
  }
}
