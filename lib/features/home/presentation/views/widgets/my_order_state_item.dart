import 'package:flutter/material.dart';
import 'package:fruits_hub/core/constant/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:timelines_upgraded/timelines_upgraded.dart';

class MyOrderStateItem extends StatelessWidget {
  const MyOrderStateItem({
    super.key,
    required this.isShowOrderDetails,
  });

  final bool isShowOrderDetails;
  final int currentStep = 3;
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
                    itemCount: OrderStatusItem.statuses.length,
                    indicatorBuilder: (_, index) {
                      final isDone = index <= currentStep;
                      return DotIndicator(
                        color: isDone
                            ? AppColors.primaryColor
                            : const Color(0xFFEBEBEB),
                        size: 12,
                      );
                    },
                    connectorBuilder: (_, index, ___) {
                      final isDone = index < currentStep;
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
                            /// التاريخ على اليسار
                            Text(
                              OrderStatusItem.statuses[index],
                              style: TextStyles.semiBold13.copyWith(
                                color: index <= currentStep
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),

                            /// اسم الحالة على اليمين
                            Text(
                              OrderStatusItem.dates[index],
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
}

class OrderStatusItem {
  static final List<String> statuses = [
    "تتبع الطلب",
    "قبول الطلب",
    "تم شحن الطلب",
    "خرج التوصيل",
    "تم تسليم",
  ];

  static final List<String> dates = [
    "22 مارس , 2024",
    "22 مارس , 2024",
    "22 مارس , 2025",
    "قيدالإنتظار",
    "تم التسليم",
  ];
}
