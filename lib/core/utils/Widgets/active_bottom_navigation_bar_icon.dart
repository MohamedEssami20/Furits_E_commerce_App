import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

class AcativeBottomNavigationIcon extends StatelessWidget {
  const AcativeBottomNavigationIcon(
      {super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: Container(
        width: 140,
        padding: const EdgeInsetsDirectional.only(start: 6),
        decoration: ShapeDecoration(
          color: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  width: 25,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.surface,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyles.semiBold16
                    .copyWith(color: MyColors.kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
