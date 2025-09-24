import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/errors/firebase_exception.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';

import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import '../../../features/checkout/data/models/order_model.dart';
import 'orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DataBaseService dataBaseService;

  OrdersRepoImpl({required this.dataBaseService});
  FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderEntity ordereEntity,
      required String genralErrorMessage}) async {
    try {
      OrderModel orderModel = OrderModel.fromEntity(ordereEntity);
      await dataBaseService.addDataWithDocumentId(
        mainPath: BackendEndpoints.addOrder,
        subPath: BackendEndpoints.addUserOrders,
        data: orderModel.toJson(),
        mainDocumentId: firebaseAuthService.getCurrentUser()!,
        subDocumentId: orderModel.orderId,
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      log("error to add order = ${e.message.toString()}");
      return left(FirebaseExceptionHandler.fromFirebaseException(e));
    } catch (e) {
      log("error to add order 2 = ${e.toString()}");
      return left(ServerFailure(errorMessage: genralErrorMessage));
    }
  }
}
