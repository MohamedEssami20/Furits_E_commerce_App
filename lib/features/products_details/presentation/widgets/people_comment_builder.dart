import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helper/get_user_review_dummy_data.dart';
import '../manager/cubit/reviews_cubit.dart';
import 'people_comments_list.dart';

class PeopleCommentsBuilder extends StatefulWidget {
  const PeopleCommentsBuilder({super.key, required this.productId});
  final String productId;

  @override
  State<PeopleCommentsBuilder> createState() => _PeopleCommentsBuilderState();
}

class _PeopleCommentsBuilderState extends State<PeopleCommentsBuilder> {
  bool isLoading = false;
  @override
  void didChangeDependencies() {
    if (!isLoading) {
      isLoading = true;
      context.read<ReviewsCubit>().getReviews(
            productId: widget.productId,
            genralErrorMessage: S.of(context).errorMessage,
          );
      isLoading = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      buildWhen: (previous, current) {
        return current is GetReviewsSuccess ||
            current is GetReviewsFailure ||
            current is GetReviewsLoading;
      },
      builder: (context, state) {
        if (state is GetReviewsSuccess) {
          return PeopleCommentsList(
            userReviewEntity: state.reviewsList,
          );
        } else {
          return Skeletonizer(
            child: PeopleCommentsList(
              userReviewEntity: [
                getReviewDummyData(),
                getReviewDummyData(),
                getReviewDummyData(),
              ],
            ),
          );
        }
      },
    );
  }
}
