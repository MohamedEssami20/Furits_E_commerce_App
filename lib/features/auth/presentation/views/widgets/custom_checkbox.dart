import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/core/utils/my_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 25,
        height: 25,
        duration: const Duration(milliseconds: 120),
        decoration: ShapeDecoration(
          color: isChecked ? MyColors.kPrimaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? MyColors.kPrimaryColor : const Color(0xffDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? SvgPicture.asset(Assets.assetsImagesCheck)
            : const SizedBox(),
      ),
    );
  }
}
