import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/get_percent_rating_cubit/get_percent_rating_cubit.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../generated/l10n.dart';
import 'rating_bar_item.dart';

class SummaryOfRating extends StatefulWidget {
  const SummaryOfRating({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<SummaryOfRating> createState() => _SummaryOfRatingState();
}

class _SummaryOfRatingState extends State<SummaryOfRating> {
  @override
  void initState() {
    context.read<GetPercentRatingCubit>().getPercentRatings(
          productId: widget.productEntity.id,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).summary,
              style: TextStyles.semiBold16.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
        Row(
          spacing: 12,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    spacing: 4,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFFB400),
                        size: 20,
                      ),
                      Text(
                        widget.productEntity.avgRating
                            .toString()
                            .substring(0, 3),
                        style: TextStyles.bold13.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '88%',
                    style: TextStyles.regular13.copyWith(
                      height: 1.40,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    S.of(context).suggested,
                    style: TextStyles.regular13.copyWith(
                      height: 1.40,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 4,
              child: RatingSummaryBuilder(),
            ),
          ],
        ),
      ],
    );
  }
}

class RatingSummaryBuilder extends StatelessWidget {
  const RatingSummaryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPercentRatingCubit, GetPercentRatingState>(
      builder: (context, state) {
        if (state is GetAllPercentRatingSuccess) {
          log("percentageOfAllBarsOfRating = ${state.percentageOfAllBarsOfRating}");
          if (state.percentageOfAllBarsOfRating.isEmpty) {
            return const RatingSummary(
              percentageOfAllBarsOfRating: {
                1: 0,
                2: 0,
                3: 0,
                4: 0,
                5: 0,
              },
            );
          } else {
            return RatingSummary(
              percentageOfAllBarsOfRating: state.percentageOfAllBarsOfRating,
            );
          }
        } else {
          return const RatingSummary(
            percentageOfAllBarsOfRating: {
              1: 0,
              2: 0,
              3: 0,
              4: 0,
              5: 0,
            },
          );
        }
      },
    );
  }
}
