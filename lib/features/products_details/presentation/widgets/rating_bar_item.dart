import 'package:flutter/material.dart';
import 'rating_bar_rows.dart';

class RatingSummary extends StatelessWidget {
  const RatingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) =>
            RatingBarRow(percent: (index + 1) / 5, numbersOfBar: (5 - index)),
      ),
    );
  }
}
