import 'package:flutter/material.dart';
import 'package:frontend/features/career/logic/career_services.dart';
import 'package:frontend/features/career/ui/widgets/bottom_back_button.dart';
import 'package:frontend/features/career/ui/widgets/career_tile.dart';
import 'package:frontend/features/career/ui/widgets/test_attempt_results_header.dart';
import 'package:frontend/models/career.dart';

class CareerScreen extends StatefulWidget {
  final int testAttemptId;

  const CareerScreen({super.key, required this.testAttemptId});

  @override
  State<CareerScreen> createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  final CareerServices careerServices = CareerServices();
  List<Career> careerList = [];

  @override
  void initState() {
    super.initState();
    fetchCareerList();
  }

  fetchCareerList() async {
    careerList = await careerServices.fetchCareerResults(
        context: context, testAttemptId: widget.testAttemptId);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TestAttemptResultsHeader(),
                CareerTile(careerList: careerList),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: const BottomBackButton(),
    );
  }
}
