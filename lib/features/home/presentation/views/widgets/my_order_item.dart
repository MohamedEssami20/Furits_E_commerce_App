import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/my_order_state_item.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../checkout/domain/entities/my_orders_entity/my_orders_entity.dart';

class MyOrderItem extends StatefulWidget {
  const MyOrderItem({super.key, required this.myOrdersEntity});
  final MyOrdersEntity myOrdersEntity;
  @override
  State<MyOrderItem> createState() => _MyOrderItemState();
}

class _MyOrderItemState extends State<MyOrderItem> {
  bool isShowOrderDetails = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 4,
        left: 16,
        right: 16,
      ),
      color: const Color(0x7FF2F3F3),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 66,
                height: 66,
                decoration: const ShapeDecoration(
                  color: Color(0xFFEBF9F1) /* Green1-50 */,
                  shape: OvalBorder(),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    Assets.assetsImagesMyOrderIcon,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "طلب رقم #${widget.myOrdersEntity.orderId.substring(0, 8)}",
                    style: TextStyles.bold13.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'تم الطلب :${convertDate(widget.myOrdersEntity.orderDate)}',
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'عدد الطلبات : ',
                            style: TextStyles.regular13.copyWith(
                              color: const Color(0xFF949D9E),
                            )),
                        TextSpan(
                          text:
                              '${widget.myOrdersEntity.orderProductEntity.length}',
                          style: TextStyles.bold13.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'سعر الطلب الكلي : ',
                            style: TextStyles.regular13.copyWith(
                              color: const Color(0xFF949D9E),
                            )),
                        TextSpan(
                          text: '${widget.myOrdersEntity.totalPrice} جنيه',
                          style: TextStyles.bold13.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    isShowOrderDetails = !isShowOrderDetails;
                  });
                },
                icon: Transform.rotate(
                  angle: isShowOrderDetails ? -3.14 / 2 : 0,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          MyOrderStateItem(isShowOrderDetails: isShowOrderDetails),
        ],
      ),
    );
  }

  // create method that take data form my order entity and convert it with intl package;
  String convertDate(String date) {
    DateTime orderDate = DateTime.parse(date);
    Intl.defaultLocale = 'ar';
    return DateFormat.yMMMd().format(orderDate);
  }
}
