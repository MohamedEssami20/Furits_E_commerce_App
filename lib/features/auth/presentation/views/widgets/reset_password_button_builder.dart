import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/check_code_view.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_verification_button.dart';
import '../../../../../core/utils/app_text_style.dart';

class ResetPasswordButtonBuilder extends StatelessWidget {
  const ResetPasswordButtonBuilder({
    super.key,
    required this.formKey,
    required this.email,
    required this.onPressed,
  });

  final GlobalKey<FormState> formKey;
  final String email;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      builder: (context1, state) {
        return CustomVerificationButton(
          onPressed: onPressed,
          title: state is SendCodeVerificationLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  "نسيت كلمة المرور",
                  style: TextStyles.bold16.copyWith(color: Colors.white),
                ),
        );
      },
      listener: (context, state) {
        if (state is SendCodeVerificationFailure) {
          buildErrorSnackBar(context, state.errorMessage);
        }

        if (state is SendCodeVerificationSuccess) {
          Navigator.of(context).pushNamed(CheckCodeView.routeName);
        }
      },
    );
  }
}
