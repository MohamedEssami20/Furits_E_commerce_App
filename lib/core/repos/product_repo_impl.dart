import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/errors/firebase_exception.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/repos/product_repos.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';

import '../utils/backend_endpoints.dart';
import 'package:rxdart/rxdart.dart' as rx;

class ProductRepoImpl extends ProductRepos {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});

  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct(
      {required String genralErrorMessage}) async {
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

      var favSanpShot = await dataBaseService.getDataWithDocumentId(
          mainPath: BackendEndpoints.getFavorites,
          subPath: BackendEndpoints.getUserFavorites,
          mainDocumentId: firebaseAuthService.getCurrentUser()!,
          query: {
            "orderBy": "rating",
            "descending": true,
          });
      List<ProductEntity> finalProducts =
          getFinalProducts(favSanpShot, products);
      return right(finalProducts);
    } catch (e) {
      return left(
        ServerFailure(errorMessage: genralErrorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct(
      {required String genralErrorMessage}) async {
    try {
      List<Map<String, dynamic>> data = await dataBaseService.getData(
          path: BackendEndpoints.getProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.formJson(e).toEntity()).toList();

      var favSanpShot = await dataBaseService.getDataWithDocumentId(
          mainPath: BackendEndpoints.getFavorites,
          subPath: BackendEndpoints.getUserFavorites,
          mainDocumentId: firebaseAuthService.getCurrentUser()!);

      List<ProductEntity> finalProducts =
          getFinalProducts(favSanpShot, products);
      for (int counter = 0; counter < finalProducts.length; counter++) {
      }
      return right(finalProducts);
    } catch (e) {
      return left(
        ServerFailure(errorMessage: genralErrorMessage),
      );
    }
  }

  List<ProductEntity> getFinalProducts(
      List<Map<String, dynamic>> favSanpShot, List<ProductEntity> products) {
    List<String> ids = [];
    for (var element in favSanpShot) {
      ids.add(element["productId"]);
    }

    List<ProductEntity> finalProducts = products.map((e) {
      return ProductEntity(
        id: e.id,
        name: e.name,
        code: e.code,
        price: e.price,
        iamgeUrl: e.iamgeUrl,
        image: e.image,
        isOraganic: e.isOraganic,
        isFeatured: e.isFeatured,
        description: e.description,
        expeireationMonths: e.expeireationMonths,
        numberOfCalories: e.numberOfCalories,
        unitAmount: e.unitAmount,
        reviews: e.reviews,
        isFavorite: ids.contains(e.id),
      );
    }).toList();
    return finalProducts;
  }

  // implementation of add to favorites;

  @override
  Future<Either<Failure, void>> addToFavorites(
      {required String productId, required String genralErrorMessage}) async {
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
        FirebaseExceptionHandler.fromFirebaseException(e),
      );
    } catch (e) {
      log("error to add to favorites 2 = ${e.toString()}");
      return left(ServerFailure(errorMessage: genralErrorMessage));
    }
  }

  @override
  Stream<Either<Failure, List<ProductEntity>>> getFavoritesProducts(
      {required String genralErrorMessage}) async* {
    try {
      Stream<List<String>> idsStream = dataBaseService.getStreamStringData(
        mainPath: BackendEndpoints.getFavorites,
        subPath: BackendEndpoints.getUserFavorites,
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
      );

      yield* idsStream.switchMap((ids) async* {
        if (ids.isEmpty) {
          yield right([]);
        } else {
          // get favorite products with whereIn;
          final result = FirebaseFirestore.instance
              .collection(BackendEndpoints.getProducts)
              .where("productId", whereIn: ids.take(10).toList())
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
      yield left(
        FirebaseExceptionHandler.fromFirebaseException(e),
      );
    } catch (e) {
      log("error to get favorites products 2 = ${e.toString()}");
      yield left(ServerFailure(errorMessage: genralErrorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavoriteProduct(
      {required String productId, required String genralErrorMessage}) async {
    try {
      await dataBaseService.deleteDataWithDocumentId(
        mainPath: BackendEndpoints.addToFavorites,
        subPath: BackendEndpoints.addUserFavorites,
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
        subDocumentId: productId,
      );
      return right(null);
    } on FirebaseException catch (e) {
      log("error to remove from favorites = ${e.message.toString()}");
      return left(
        FirebaseExceptionHandler.fromFirebaseException(e),
      );
    } catch (e) {
      log("error to remove from favorites 2 = ${e.toString()}");
      return left(ServerFailure(errorMessage: genralErrorMessage));
    }
  }
}
