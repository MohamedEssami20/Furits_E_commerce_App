import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/features/auth/presentation/manager/signup_cubit/signup_user_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupUserCubit, SignupUserState>(
      listener: (context, state) {
        if (state is SignupUserSuccess) {
          Navigator.of(context).pop();
        }
        if (state is SignupUserFailure) {
          buildErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupUserLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }

}
