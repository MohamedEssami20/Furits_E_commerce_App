import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';

import '../../../features/checkout/domain/entities/order_entity.dart' show OrderEntity;

abstract class OrdersRepo {
  // create method that add order to backend;
  Future<Either<Failure,void>> addOrder({required OrderEntity ordereEntity});
}
