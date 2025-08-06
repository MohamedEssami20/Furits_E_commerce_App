import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import '../../../../../../core/helper/get_payment_currency.dart';
import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };

  factory Amount.fromEntity(OrderEntity orderEntity) => Amount(
        total: orderEntity.calculateTotalPriceAfterShipping().toString(),
        currency:getCurrency(),
        details: DetailsEntity.fromEntity(orderEntity),
      );
}
