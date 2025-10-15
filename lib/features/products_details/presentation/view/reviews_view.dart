import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/cubit/rating_count_cubit/rating_count_cubit.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/cubit/reviews_cubit.dart';
import 'package:fruits_hub/features/products_details/presentation/widgets/reviews_section_body.dart';

class ReviewsView extends StatefulWidget {
  const ReviewsView({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  @override
  void initState() {
    context.read<ReviewsCubit>().isUserCommented(productId: widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingCountCubit(),
      child: ReviewsSectionBody(
        productId: widget.productId,
      ),
    );
  }
}
