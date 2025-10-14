import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_appbar.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/products_details/presentation/widgets/people_comment_builder.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../manager/details_and_reviews_cubit/detais_and_reviews_cubit.dart';
import 'reviews_stars_item.dart';
import 'summary_of_rating.dart';
import 'write_comment_text_field.dart';

class ReviewsSectionBody extends StatelessWidget {
  const ReviewsSectionBody({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBarOne(
            title: S.of(context).reviews,
            context: context,
            showBackButton: true,
            onBackPress: () =>
                context.read<DetailsAndReviewsCubit>().changeIndex(0),
          ),
          const SizedBox(
            height: 18,
          ),
          WriteCommentTextField(
            productId: productId,
          ),
          const SizedBox(
            height: 20,
          ),
          const ReviewStarsItem(),
          const SizedBox(
            height: 16,
          ),
          Text(
            '324 ${S.of(context).review}',
            style: TextStyles.bold13.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SummaryOfRating(),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: PeopleCommentsBuilder(
              productId: productId,
            ),
          ),
        ],
      ),
    );
  }
}
