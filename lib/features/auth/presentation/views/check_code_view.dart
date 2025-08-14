import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';

import '../../domain/repos/reset_password_repo.dart';
import '../manager/reset_password_cubit/reset_password_cubit.dart';
import 'widgets/check_code_view_body.dart';

class CheckCodeView extends StatelessWidget {
  const CheckCodeView({super.key, required this.email});
  static const String routeName = 'CheckCodeView';
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        resetPasswordRepo: getIt.get<ResetPasswordRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: "التحقق من الرمز",
          showBackButton: true,
          showNotification: false,
        ),
        body: CheckCodeViewBody(
          email: email,
        ),
      ),
    );
  }
}
