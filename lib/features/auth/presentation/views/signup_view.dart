import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

import '../../../../core/utils/Widgets/build_appbar.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = "SignUproutename";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(title: "حساب جديد", context: context),
      body: const SignupViewBody(),
    );
  }
}
