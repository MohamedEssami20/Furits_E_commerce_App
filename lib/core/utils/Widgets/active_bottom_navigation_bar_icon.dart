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
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
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
