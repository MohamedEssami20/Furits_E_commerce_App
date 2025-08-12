import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/create_new_password_view_body.dart';


class CreateNewPsswordView extends StatelessWidget {
  const CreateNewPsswordView({super.key});
  static const routeName = "create-new-password-view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "كلمة مرور جديدة",
        showBackButton: true,
        showNotification: false,
      ),
      body: const CreateNewPasswordViewBody(),
    );
  }
}
