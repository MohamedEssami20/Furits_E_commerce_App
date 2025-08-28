import 'package:flutter/material.dart';

class MyOrderStateItem extends StatelessWidget {
  const MyOrderStateItem({
    super.key,
    required this.isShowOrderDetails,
  });

  final bool isShowOrderDetails;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isShowOrderDetails
          ? const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: 10,
                  thickness: 0.5,
                ),
                Text("state of order"),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
