import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/products_details/data/models/user_comment_model.dart';

import '../entities/user_comments_entity.dart';

abstract class ReviewsRepos {
  // create method that add comments to product in reviews;
  Future<Either<Failure, void>> addReviewe(
      {required String productId,
      required UserReviewModel userCommentModel,
      required String genralErrorMessage});

  // create method that get comments from product in reviews;
  Stream<Either<Failure, List<UserReviewEntity>>> getReviews(
      {required String productId, required String genralErrorMessage});

  // create method that update length of reviews count;
  Future<Either<Failure, void>> updateRatingCount({required String productId});

  // create method that update avarage rating;
  Future<Either<Failure, void>> updateAverageRating({required String productId});
  
  // create stream method that check if user commented on product;
  Stream<Either<Failure, bool>> isUserCommented({required String productId});
  
}
