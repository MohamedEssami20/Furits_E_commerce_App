import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/products_details/domain/repos/reviews_repos.dart';

import '../../../data/models/user_comment_model.dart';

part 'reviews_cubit_state.dart';

class ReviewsCubitCubit extends Cubit<ReviewsCubitState> {
  ReviewsCubitCubit({required this.reviewsRepos})
      : super(ReviewsCubitInitial());
  final ReviewsRepos reviewsRepos;

  // create method that add comments
  Future<void> addComment(
      {required String productId,
      required UserCommentModel userCommentModel,
      required String genralErrorMessage}) async {
    emit(AddCommentLoading());
    final result = await reviewsRepos.addComment(
        productId: productId,
        userCommentModel: userCommentModel,
        genralErrorMessage: genralErrorMessage);
    result.fold((failure) {
      emit(
        AddCommentFailure(errormessage: failure.errorMessage),
      );
    }, (_) {
      emit(
        AddCommentSuccess(),
      );
    });
  }
}
