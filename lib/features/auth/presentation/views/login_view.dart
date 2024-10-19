import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_appbar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "تسجيل الدخول"),
      body: const LoginViewBody(),
    );
  }

 
}
