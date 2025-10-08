import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/generated/l10n.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: S.of(context).search,
          hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          contentPadding: const EdgeInsets.only(
            bottom: 16,
          ),
          suffixIcon: SvgPicture.asset(
            Assets.assetsImagesFilterIcon,
            width: 15,
            height: 15,
            fit: BoxFit.scaleDown,
          ),
          prefixIcon: SvgPicture.asset(
            Assets.assetsImagesSearchIcon,
            width: 15,
            height: 15,
            fit: BoxFit.scaleDown,
          ),
          enabledBorder: buildBorder(theme),
          focusedBorder: buildBorder(theme),
          border: buildBorder(theme),
          filled: true,
          fillColor: theme.colorScheme.secondaryContainer,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder(ThemeData theme) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 1,
        color: theme.colorScheme.secondary,
      ),
    );
  }
}
