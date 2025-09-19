import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';
import 'package:fruits_hub/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../domain/repos/reset_password_repo.dart';
import 'widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'ForgetPasswordView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        resetPasswordRepo: getIt.get<ResetPasswordRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: S.of(context).forgetPasswordButton,
          showBackButton: true,
          showNotification: false,
        ),
        body: const ForgetPasswordViewBody(),
      ),
    );
  }
}
