import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruits_hub/generated/l10n.dart';
import '../../../../core/utils/app_text_style.dart';
import '../manager/rating_count_cubit/rating_count_cubit.dart';

class ReviewStarsItem extends StatelessWidget {
  const ReviewStarsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final raingcount = context.watch<RatingCountCubit>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        Text(S.of(context).ratePorduct, style: TextStyles.bold13),
        BlocBuilder<RatingCountCubit, int>(
          builder: (context, state) {
            return RatingBarIndicator(
              rating: raingcount.toDouble(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.read<RatingCountCubit>().setCurrentRating(index + 1);
                },
                child: Icon(
                  Icons.star,
                  color: raingcount > index ? Colors.amber : Colors.grey,
                ),
              ),
              itemCount: 5,
              itemSize: 30.0,
              direction: Axis.horizontal,
            );
          },
        ),
      ],
    );
  }
}
