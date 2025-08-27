import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/build_error_snackbar.dart';
import '../../../../../../core/utils/app_text_style.dart' show TextStyles;
import '../../../../../auth/presentation/views/signin_view.dart';
import '../../../manager/edit_user_info_cubit/user_cubit.dart';
import '../../../manager/profile_view_cubit/profile_view_cubit.dart';

class SendEditingUserInfoBuilder extends StatelessWidget {
  const SendEditingUserInfoBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is EditUserPasswordSuccess || state is EditUserEmailSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginView.routeName,
            (route) => false,
          );
          buildErrorSnackBar(context, getUserEditingMessageSuccess(state));
        }
        if (state is EditUserNameSuccess) {
          context.read<ProfileViewCubit>().changeIndex(0);
          buildErrorSnackBar(context, getUserEditingMessageSuccess(state));
        }
        if (state is EditUserPasswordFailure ||
            state is EditUserEmailFailure ||
            state is EditUserNameFailure) {
          buildErrorSnackBar(context, getUserEditingMessageError(state));
        }
      },
      builder: (context, state) {
        return state is EditUserPasswordLoading ||
                state is EditUserEmailLoading ||
                state is EditUserNameLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                "حفظ التغييرات",
                style: TextStyles.bold16.copyWith(color: Colors.white),
              );
      },
    );
  }
}

String getUserEditingMessageSuccess(UserState state) {
  if (state is EditUserPasswordSuccess) {
    return "تم تغيير كلمة المرور بنجاح برجاء تسجيل الدخول مرة اخرى";
  } else if (state is EditUserEmailSuccess) {
    return "لقد تم إرسال رابط تاكيد البريد الالكتروني على البريد الالكتروني الجديد";
  } else if (state is EditUserNameSuccess) {
    return "تم تغيير الاسم بنجاح";
  } else {
    return "";
  }
}

String getUserEditingMessageError(UserState state) {
  if (state is EditUserPasswordFailure) {
    return state.errorMessage;
  } else if (state is EditUserEmailFailure) {
    return state.errorMessage;
  } else if (state is EditUserNameFailure) {
    return state.errorMessage;
  } else {
    return "";
  }
}
