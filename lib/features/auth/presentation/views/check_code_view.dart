import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';

import 'widgets/check_code_view_body.dart';

class CheckCodeView extends StatelessWidget {
  const CheckCodeView({super.key});
  static const String routeName = 'CheckCodeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "التحقق من الرمز",
        showBackButton: true,
        showNotification: false,
      ),
      body: const CheckCodeViewBody(),
    );
  }
}
