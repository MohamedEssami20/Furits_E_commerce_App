import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';

import '../entities/user_comments_entity.dart';

abstract class ReviewsRepos {
  Future<Either<Failure, void>> addComment(
      {required String productId, required UserCommentsEntity userCommentsEntity});
}
