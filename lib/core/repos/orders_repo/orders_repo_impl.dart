import 'package:dartz/dartz.dart';

import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoints.dart';

import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import '../../../features/checkout/data/models/order_model.dart';
import 'orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DataBaseService dataBaseService;

  OrdersRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderEntity ordereEntity}) async {
    try {
      OrderModel orderModel=OrderModel.fromEntity(ordereEntity);
      await dataBaseService.addData(
        path: BackendEndpoints.addOrder,
        data: orderModel.toJson(),
        documentId: orderModel.orderId,
      );
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
