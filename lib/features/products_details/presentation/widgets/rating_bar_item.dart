import 'package:flutter/material.dart';
import 'rating_bar_rows.dart';

class RatingSummary extends StatelessWidget {
  const RatingSummary({super.key, required this.percentageOfAllBarsOfRating});
  final Map<int, double> percentageOfAllBarsOfRating;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) => RatingBarRow(
          percent: getPercentageOfAllBarsOfRating(
                  index, percentageOfAllBarsOfRating) /
              100,
          numbersOfBar: (5 - index),
        ),
      ),
    );
  }

  double getPercentageOfAllBarsOfRating(
      int index, Map<int, double> percentage) {
    switch (index) {
      case 0:
        return percentage[5]!;
      case 1:
        return percentage[4]!;
      case 2:
        return percentage[3]!;
      case 3:
        return percentage[2]!;
      case 4:
        return percentage[1]!;
      default:
        return 0;
    }
  }
}
