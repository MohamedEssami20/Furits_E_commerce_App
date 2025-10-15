import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/products_details/data/models/user_comment_model.dart';
import 'package:fruits_hub/features/products_details/domain/entities/user_comments_entity.dart';
import '../../../../core/errors/firebase_exception.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/repos/reviews_repos.dart';

class ReviewsReposImpl implements ReviewsRepos {
  final DataBaseService dataBaseService;
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
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

  @override
  Future<Either<Failure, void>> updateRatingCount(
      {required String productId}) async {
    try {
      final ratingCount = await dataBaseService.getDataWithDocumentId(
        mainPath: BackendEndpoints.reviewsCollection,
        subPath: BackendEndpoints.productComments,
        mainDocumentId: productId,
      );
      await dataBaseService.addData(
        path: BackendEndpoints.getProducts,
        documentId: productId,
        data: {
          "ratingCount": ratingCount.length,
        },
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("error to get rating count = ${e.message.toString()}");
      return left(
        FirebaseExceptionHandler.fromFirebaseException(e),
      );
    } catch (e) {
      log("error to get rating count 2 = ${e.toString()}");
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Stream<Either<Failure, List<UserReviewEntity>>> getReviews(
      {required String productId, required String genralErrorMessage}) async* {
    try {
      final reviews = dataBaseService.getStreamDataWithDocumentId(
        mainPath: BackendEndpoints.reviewsCollection,
        subPath: BackendEndpoints.productComments,
        documentId: productId,
      );
      await for (var element in reviews) {
        final reviewsEntities = element
            .map(
              (e) => UserReviewModel.fromJson(e.data()).toEntity(),
            )
            .toList();
        yield right(reviewsEntities);
      }
    } on FirebaseException catch (e) {
      log("error to get reviews = ${e.message.toString()}");
      yield left(
        FirebaseExceptionHandler.fromFirebaseException(e),
      );
    } catch (e) {
      log("error to get reviews 2 = ${e.toString()}");
      yield left(
        ServerFailure(
          errorMessage: genralErrorMessage,
        ),
      );
    }
  }

  @override
  Stream<Either<Failure, bool>> isUserCommented(
      {required String productId}) async* {
    String userId = firebaseAuthService.getCurrentUser()!;
    try {
      final reviews = dataBaseService.getStreamDataWithDocumentId(
        mainPath: BackendEndpoints.reviewsCollection,
        subPath: BackendEndpoints.productComments,
        documentId: productId,
      );
      await for (var element in reviews) {
        final reviewsEntities = element
            .map(
              (e) => UserReviewModel.fromJson(e.data()).toEntity(),
            )
            .toList();
        yield right(reviewsEntities.any((e) => e.userId == userId));
      }
    } on FirebaseException catch (e) {
      yield left(
        FirebaseExceptionHandler.fromFirebaseException(e),
      );
    } catch (e) {
      yield left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
