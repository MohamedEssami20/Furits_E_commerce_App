import 'package:flutter/material.dart';

import '../../features/checkout/domain/entities/order_entity.dart';
import '../../generated/l10n.dart';
import 'build_error_snackbar.dart';

void handelpayWithCash(OrderEntity orderEntity, BuildContext context,
    int currentPageIndex, PageController pageController) {
  if (orderEntity.payWithCash != null) {
    pageController.animateToPage(
      currentPageIndex + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  } else {
    buildErrorSnackBar(context, S.of(context).choosePaymentMethod);
  }
}
