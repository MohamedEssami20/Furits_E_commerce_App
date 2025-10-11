import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

AppBar buildAppBarOne(
    {required String title,
    required BuildContext context,
    bool? showBackButton,
    void Function()? onBackPress}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    leading: Visibility(
      visible: showBackButton ?? true,
      child: IconButton(
        onPressed: onBackPress ?? () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    ),
  );
}
