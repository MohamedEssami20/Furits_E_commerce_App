import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/products_details/data/models/user_comment_model.dart';

abstract class ReviewsRepos {
  // create method that add comments to product in reviews;
  Future<Either<Failure, void>> addReviewe(
      {required String productId,
      required UserReviewModel userCommentModel,
      required String genralErrorMessage});
}
