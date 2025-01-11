import 'package:flutter/material.dart';

class PersonalInfoTile extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;

  const PersonalInfoTile({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: ListTile(
            leading: const Icon(
              color: Color.fromARGB(255, 49, 26, 72),
              Icons.person,
              size: 30,
            ),
            title: Text(
              '$firstName $lastName',
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: ListTile(
            leading: const Icon(
              color: Color.fromARGB(255, 49, 26, 72),
              Icons.email,
              size: 30,
            ),
            title: Text(
              email,
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ),
      ],
    );
  }
}
