import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/features/products_details/data/models/user_comment_model.dart';
import '../../../../core/errors/firebase_exception.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repos/reviews_repos.dart';

class ReviewsReposImpl implements ReviewsRepos {
  final DataBaseService dataBaseService;

  ReviewsReposImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addReviewe(
      {required String productId,
      required UserReviewModel userCommentModel,
      required String genralErrorMessage}) async {
    try {
      await dataBaseService.addDataWithDocumentId(
        mainPath: BackendEndpoints.reviewsCollection,
        subPath: BackendEndpoints.productComments,
        data: userCommentModel.toJson(),
        mainDocumentId: productId,
        subDocumentId: userCommentModel.userId,
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("error to add comment = ${e.message.toString()}");
      return left(
        FirebaseExceptionHandler.fromFirebaseException(e),
      );
    } catch (e) {
      log("error to add comment 2 = ${e.toString()}");
      return left(
        ServerFailure(
          errorMessage: genralErrorMessage,
        ),
      );
    }
  }
}
