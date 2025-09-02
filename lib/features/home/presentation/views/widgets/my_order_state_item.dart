
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:timelines_upgraded/timelines_upgraded.dart';

class MyOrderStateItem extends StatelessWidget {
  const MyOrderStateItem({
    super.key,
    required this.isShowOrderDetails,
    required this.orderStatus,
  });
  final Map<String, dynamic> orderStatus;
  final bool isShowOrderDetails;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isShowOrderDetails
          ? Column(
              spacing: 8,
              children: [
                const Divider(
                  height: 10,
                  thickness: 0.5,
                ),
                FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    nodePosition: 0,
                  ),
                  builder: TimelineTileBuilder.connected(
                    itemCount: orderStatus.length,
                    indicatorBuilder: (_, index) {
                      final key = OrderStatusItem.statuses[index].key;
                      final statusValue = orderStatus[key];
                      final isDone =
                          statusValue != "قيد الإنتظار" && statusValue != null;
                      return DotIndicator(
                        color: isDone
                            ? AppColors.primaryColor
                            : const Color(0xFFEBEBEB),
                        size: 12,
                      );
                    },
                    connectorBuilder: (_, index, ___) {
                      bool isDone = isOldOrderStatusDone(index);
                      return SolidLineConnector(
                        color: isDone
                            ? AppColors.lightSecondaryColor
                            : Colors.transparent,
                      );
                    },
                    contentsBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, right: 8, left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// اسم الحالة
                            Text(
                              OrderStatusItem.statuses[index].value,
                              style: TextStyles.semiBold13.copyWith(
                                color: index <= orderStatus.length
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),

                            /// تاريخ الحالة
                            Text(
                              orderStatus[OrderStatusItem.statuses[index].key],
                              style: TextStyles.semiBold13.copyWith(
                                color: const Color(0xFF949D9E),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  bool isOldOrderStatusDone(int index) {
    final currentKey = OrderStatusItem.statuses[index].key;
    final nextKey = index + 1 < OrderStatusItem.statuses.length
        ? OrderStatusItem.statuses[index + 1].key
        : null;
    final currentStatusValue = orderStatus[currentKey];
    final nextStatusValue = nextKey != null ? orderStatus[nextKey] : null;
    final isDone = currentStatusValue != "قيد الإنتظار" &&
        currentStatusValue != null &&
        nextStatusValue != "قيد الإنتظار" &&
        nextStatusValue != null &&
        nextStatusValue != "قيد الإنتظار";
    return isDone;
  }
}

class OrderStatusItem {
  static final List<MapEntry<String, String>> statuses = [
    const MapEntry("trackingOrder", "تتبع الطلب"),
    const MapEntry("acceptedOrder", "قبول الطلب"),
    const MapEntry("orderShipped", "تم شحن الطلب"),
    const MapEntry("orderOnWay", "خرج التوصيل"),
    const MapEntry("orderReceived", "تم التسليم"),
  ];
}
