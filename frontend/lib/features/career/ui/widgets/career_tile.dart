import 'package:flutter/material.dart';
import 'package:frontend/models/career.dart';

class CareerTile extends StatelessWidget {
  final List<Career>? careerList;
  final List<Color> careerColors = [
    const Color.fromARGB(200, 163, 234, 193),
    const Color.fromARGB(200, 163, 234, 193),
    const Color.fromARGB(200, 225, 245, 162),
    const Color.fromARGB(200, 225, 245, 162),
    const Color.fromARGB(200, 251, 202, 162),
  ];

  CareerTile({
    super.key,
    required this.careerList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (careerList != null)
          for (int i = 0; i < careerList!.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                color: careerColors[i],
                child: ListTile(
                  title: Text(
                    careerList![i].title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Description: ${careerList![i].description ?? 'Not Available'}'),
                      Text(
                          'Industry: ${careerList![i].industry ?? 'Not Available'}'),
                      Text(
                          'Salary Range: ${careerList![i].salaryRange ?? 'Not Available'}'),
                    ],
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
