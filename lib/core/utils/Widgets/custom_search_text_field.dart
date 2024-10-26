import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/utils/assets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0x0A000000),
          blurRadius: 9,
          offset: Offset(0, 2),
          spreadRadius: 0,
        )
      ]),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: "ابحث عن.......",
          hintStyle: TextStyles.regular13.copyWith(
            color: const Color(0xff949E9D),
          ),
          suffixIcon: SizedBox(
              width: 30,
              child: Center(
                  child: SvgPicture.asset(Assets.assetsImagesFilterIcon))),
          prefixIcon: SizedBox(
              width: 30,
              child: Center(
                  child: SvgPicture.asset(Assets.assetsImagesSearchIcon))),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          border: buildBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}
