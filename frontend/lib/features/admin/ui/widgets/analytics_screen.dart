import 'package:flutter/material.dart';
import 'package:frontend/features/test_attempt/logic/test_attempt_services.dart';
import 'package:frontend/models/sum_of_ratings.dart';
import 'package:frontend/utils/custom_colors.dart';
import 'package:frontend/utils/pair.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final TestAttemptServices attemptServices = TestAttemptServices();
  SumOfRatings? ratings;

  @override
  void initState() {
    super.initState();
    fetchRatings();
  }

  fetchRatings() async {
    ratings = await attemptServices.getRatingsSummary(context: context);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ratings == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Material(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Content ratings'),
                ),
                const SizedBox(
                  height: 5,
                ),
                SfCartesianChart(
                  plotAreaBackgroundColor: CustomColors.primaryBrown,
                  primaryXAxis: const CategoryAxis(),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ColumnSeries<Pair<dynamic, dynamic>, String>>[
                    ColumnSeries<Pair<dynamic, dynamic>, String>(
                      color: CustomColors.primaryPink,
                      dataSource: <Pair<dynamic, dynamic>>[
                        Pair('1 stars', ratings?.numberOfOneContentRating),
                        Pair('2 stars', ratings?.numberOfTwoContentRating),
                        Pair('3 stars', ratings?.numberOfThreeContentRating),
                        Pair('4 stars', ratings?.numberOfFourContentRating),
                        Pair('5 stars', ratings?.numberOfFiveContentRating),
                      ],
                      xValueMapper: (Pair<dynamic, dynamic> rating, _) =>
                          rating.first,
                      yValueMapper: (Pair<dynamic, dynamic> rating, _) =>
                          rating.second,
                      name: 'Rating',
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Experience ratings'),
                ),
                const SizedBox(
                  height: 5,
                ),
                SfCartesianChart(
                  plotAreaBackgroundColor: CustomColors.primaryBrown,
                  primaryXAxis: const CategoryAxis(),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ColumnSeries<Pair<dynamic, dynamic>, String>>[
                    ColumnSeries<Pair<dynamic, dynamic>, String>(
                      color: CustomColors.primaryPink,
                      dataSource: <Pair<dynamic, dynamic>>[
                        Pair('1 stars', ratings?.numberOfOneExperienceRating),
                        Pair('2 stars', ratings?.numberOfTwoExperienceRating),
                        Pair('3 stars', ratings?.numberOfThreeExperienceRating),
                        Pair('4 stars', ratings?.numberOfFourExperienceRating),
                        Pair('5 stars', ratings?.numberOfFiveExperienceRating),
                      ],
                      xValueMapper: (Pair<dynamic, dynamic> rating, _) =>
                          rating.first,
                      yValueMapper: (Pair<dynamic, dynamic> rating, _) =>
                          rating.second,
                      name: 'Rating',
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
