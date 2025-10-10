import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_network_image.dart';
import '../../../../core/utils/custom_appbar_clipper.dart';

class ProductsDetailsAppBar extends StatelessWidget {
  const ProductsDetailsAppBar({
    super.key,
    required this.height,
    required this.theme,
    required this.textDirection,
    required this.image,
  });

  final double height;
  final ThemeData theme;
  final TextDirection textDirection;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: CustomAppBarClipper(),
          child: Container(
            height: height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
            ),
          ),
        ),
        // positioned of back button;
        Positioned.directional(
          textDirection: textDirection,
          start: 10,
          top: 45,
          child: Container(
            width: 44,
            height: 44,
            padding: const EdgeInsetsDirectional.only(start: 6),
            decoration: ShapeDecoration(
              color: theme.colorScheme.secondaryContainer,
              shape: const OvalBorder(),
            ),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: theme.colorScheme.onSurface,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
            ),
          ),
        ),
        // positioned of product image;
        Positioned.fill(
          top: height * 0.04,
          child: Center(
            child: CustomNetowrkImage(
              imageUrl: image,
              width: 200,
            ),
          ),
        ),
      ],
    );
  }
}
