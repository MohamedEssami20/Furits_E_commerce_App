import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';

import '../utils/backend_endpoints.dart';

class ProductRepoImpl extends ProductRepos {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});

  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      List<Map<String, dynamic>> data = await dataBaseService.getData(
        path: BackendEndpoints.getProducts,
        query: {
          "orderBy": "rating",
          "descending": true,
        },
      ) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.formJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(
          errorMessage: "there was an error when fetching products"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data = await dataBaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.formJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      log("error to get product = ${e.toString()}");
      return left(
        ServerFailure(
            errorMessage: "there was an error when fetching products"),
      );
    }
  }

  // implementation of add to favorites;

  @override
  Future<Either<Failure, void>> addToFavorites(
      {required String productId}) async {
    try {
      await dataBaseService.addDataWithDocumentId(
        mainPath: BackendEndpoints.addToFavorites,
        subPath: BackendEndpoints.addUserFavorites,
        data: {
          "productId": productId,
        },
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
        subDocumentId: productId,
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("error to add to favorites = ${e.message.toString()}");
      return left(
          ServerFailure(errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى"));
    } catch (e) {
      log("error to add to favorites 2 = ${e.toString()}");
      return left(
          ServerFailure(errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى"));
    }
  }

  @override
  Stream<Either<Failure, List<ProductEntity>>> getFavoritesProducts() async* {
    try {
      Stream<List<String>> idsStream = dataBaseService.getStreamStringData(
        mainPath: BackendEndpoints.getFavorites,
        subPath: BackendEndpoints.getUserFavorites,
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
      );

      yield* idsStream.asyncExpand((ids) async* {
        if (ids.isEmpty) {
          yield right([]);
        } else {
          // get favorite products with whereIn;
          final result = FirebaseFirestore.instance
              .collection(BackendEndpoints.getProducts)
              .where(FieldPath.documentId, whereIn: ids.take(10).toList())
              .snapshots()
              .map((event) => event.docs
                  .map((e) => ProductModel.formJson(e.data()).toEntity())
                  .toList());
          yield* result.map(
            (products) => right(products),
          );
        }
      });
    } on FirebaseException catch (e) {
      log("error to get favorites products = ${e.message.toString()}");
      yield left(ServerFailure(errorMessage: e.message.toString()));
    } catch (e) {
      log("error to get favorites products 2 = ${e.toString()}");
      yield left(
          ServerFailure(errorMessage: "حدث خطأ ما يرجى المحاولة مرة أخرى"));
    }
  }
}
