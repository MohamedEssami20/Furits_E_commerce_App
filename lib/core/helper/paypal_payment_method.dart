import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_hub/core/helper/app_keys.dart';

import '../../features/checkout/domain/entities/order_entity.dart';
import '../../features/checkout/domain/entities/payPal_payment_entities/pay_pal_payment_entity/pay_pal_payment_entity.dart';
import '../../features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import '../../generated/l10n.dart';
import 'build_error_snackbar.dart';

void paymentMethod(OrderEntity orderEntity, BuildContext context) {
  final OrderEntity orderEntity = context.read<OrderEntity>();
  final payPalPaymentEntity = PayPalPaymentEntity.fromEntity(orderEntity);
  var addOrderCubit = context.read<AddOrderCubit>();
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: AppKeys.kPayPalClientId,
      secretKey: AppKeys.kPayPalClientSecret,
      transactions: [
        payPalPaymentEntity.toJson(),
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map parms) async {
        Navigator.pop(context);
        addOrderCubit.addOrder(
            ordereEntity: orderEntity,
            genralErrorMessage: S.of(context).errorMessageOfPayment);
        buildErrorSnackBar(context, S.of(context).paymentSuccess);
      },
      onError: (error) {
        Navigator.pop(context);
        log("payment error= ${error.toString()}");
        buildErrorSnackBar(context, S.of(context).errorMessageOfPayment);
      },
      onCancel: () {
        log("payment canceled");
        Navigator.pop(context);
        buildErrorSnackBar(context, S.of(context).paymentCaceled);
      },
    ),
  ));
}
