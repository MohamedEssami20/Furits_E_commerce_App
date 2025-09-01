import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/domain/entities/my_orders_entity/my_orders_entity.dart';

import 'my_order_item.dart';

class MyOrdersListView extends StatelessWidget {
  const MyOrdersListView({super.key, required this.myOrders});
  final List<MyOrdersEntity> myOrders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: MyOrderItem(
          myOrdersEntity: myOrders[index],
        ),
      ),
      itemCount: myOrders.length,
    );
  }
}
