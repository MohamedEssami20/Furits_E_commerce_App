import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/cubit/rating_count_cubit/rating_count_cubit.dart';
import 'package:fruits_hub/features/products_details/presentation/widgets/reviews_section_body.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingCountCubit(),
      child: ReviewsSectionBody(
        productId: productId,
      ),
    );
  }
}
