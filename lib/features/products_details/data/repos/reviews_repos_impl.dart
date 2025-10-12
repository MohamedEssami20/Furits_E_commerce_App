import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/products_details/data/models/user_comment_model.dart';
import '../../../../core/errors/firebase_exception.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repos/reviews_repos.dart';

class ReviewsReposImpl implements ReviewsRepos {
  final FirestoreService firestoreService;

  ReviewsReposImpl({required this.firestoreService});
  @override
  Future<Either<Failure, void>> addComment(
      {required String productId,
      required UserCommentModel userCommentModel,
      required String genralErrorMessage}) async {
    try {
      await firestoreService.addDataWithDocumentId(
        mainPath: BackendEndpoints.reviewsCollection,
        subPath: BackendEndpoints.productComments,
        data: userCommentModel.toJson(),
        mainDocumentId: productId,
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
