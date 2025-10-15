import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/products_details/domain/repos/reviews_repos.dart';

import '../../../data/models/user_comment_model.dart';
import '../../../domain/entities/user_comments_entity.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit({required this.reviewsRepos}) : super(ReviewsCubitInitial());
  final ReviewsRepos reviewsRepos;

  StreamSubscription? _streamSubscription;
  StreamSubscription? _isUserCommentedSubscription;
  bool isUserCommentedFlag = false;
  // create method that add comments
  Future<void> addReview(
      {required String productId,
      required UserReviewModel userCommentModel,
      required String genralErrorMessage}) async {
    emit(AddCommentLoading());
    final result = await reviewsRepos.addReviewe(
        productId: productId,
        userCommentModel: userCommentModel,
        genralErrorMessage: genralErrorMessage);
    result.fold((failure) {
      emit(
        AddCommentFailure(errormessage: failure.errorMessage),
      );
    }, (_) async {
      await reviewsRepos.updateRatingCount(productId: productId);
      emit(
        AddCommentSuccess(),
      );
    });
  }

  // create method that get all reviwes;
  Future<void> getReviews(
      {required String productId, required String genralErrorMessage}) async {
    //emit(GetReviewsLoading());
    _streamSubscription = reviewsRepos
        .getReviews(
          productId: productId,
          genralErrorMessage: genralErrorMessage,
        )
        .listen(
          (either) => either.fold(
            (failure) => emit(
              GetReviewsFailure(errormessage: failure.errorMessage),
            ),
            (reviews) => emit(
              GetReviewsSuccess(reviewsList: reviews),
            ),
          ),
        );
  }

  // create method that check if user commented or not;
  void isUserCommented({required String productId}) {
    _isUserCommentedSubscription = reviewsRepos
        .isUserCommented(
      productId: productId,
    )
        .listen((event) {
      event.fold(
          (failure) => emit(
                IsUserCommentedFailure(errorMessage: failure.errorMessage),
              ), (isCommented) {
        isUserCommentedFlag = isCommented;
        emit(
          IsUserCommented(isCommented: isCommented),
        );
      });
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    _isUserCommentedSubscription?.cancel();
    return super.close();
  }
}
