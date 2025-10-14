import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart' show TextStyles;
import 'package:fruits_hub/features/auth/presentation/views/create_new_pssword_view.dart';

import '../../../../../core/helper/build_success_and_error_snackbar.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/reset_password_cubit/reset_password_cubit.dart';
import 'custom_verification_button.dart';

class CheckCodeVerificationBuilder extends StatelessWidget {
  const CheckCodeVerificationBuilder({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      builder: (context1, state) {
        return CustomVerificationButton(
          onPressed: onPressed,
          title: state is CheckVerificationCodeLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  S.of(context).verifyCode,
                  style: TextStyles.bold16.copyWith(color: Colors.white),
                ),
        );
      },
      listener: (context, state) {
        if (state is CheckVerificationCodeFailure) {
          buildSuccessAndErrorSnackBar(context, state.errorMessage);
        }

        if (state is CheckVerificationCodeSuccess) {
          Navigator.of(context).pushNamed(
            CreateNewPsswordView.routeName,
          );
        }
      },
    );
  }
}
