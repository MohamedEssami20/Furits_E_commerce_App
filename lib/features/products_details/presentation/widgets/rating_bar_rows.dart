import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RatingBarRow extends StatelessWidget {
  final int numbersOfBar;
  final double percent;

  const RatingBarRow(
      {super.key, required this.numbersOfBar, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 8.0,
              percent: percent,
              backgroundColor: Colors.grey[200]!,
              progressColor: Colors.orange,
              barRadius: const Radius.circular(2),
              animation: true,
            ),
          ),
          const SizedBox(width: 4),
          Text(numbersOfBar.toString(), style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
