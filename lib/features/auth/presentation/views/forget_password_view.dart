import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';

import 'widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'ForgetPasswordView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "نسيان كلمة المرور",
        showBackButton: true,
        showNotification: false,
      ),
      body: const ForgetPasswordViewBody(),
    );
  }
}
