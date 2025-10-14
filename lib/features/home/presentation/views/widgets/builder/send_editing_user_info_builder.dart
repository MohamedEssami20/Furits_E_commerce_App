import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/build_success_and_error_snackbar.dart';
import '../../../../../../core/helper/localization_helper.dart';
import '../../../../../../core/utils/app_text_style.dart' show TextStyles;
import '../../../../../../generated/l10n.dart';
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
          buildSuccessAndErrorSnackBar(
              context, getUserEditingMessageSuccess(state, context));
        }
        if (state is EditUserNameSuccess) {
          context.read<ProfileViewCubit>().changeIndex(0);
          buildSuccessAndErrorSnackBar(
              context, getUserEditingMessageSuccess(state, context));
        }
        if (state is EditUserPasswordFailure ||
            state is EditUserEmailFailure ||
            state is EditUserNameFailure) {
          buildSuccessAndErrorSnackBar(
              context, getUserEditingMessageError(state, context));
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
                S.of(context).saveChanges,
                style: TextStyles.bold16.copyWith(color: Colors.white),
              );
      },
    );
  }
}

String getUserEditingMessageSuccess(UserState state, BuildContext context) {
  if (state is EditUserPasswordSuccess) {
    return S.of(context).passwordChangedReauth;
  } else if (state is EditUserEmailSuccess) {
    return S.of(context).sendLikOfChangeEmail;
  } else if (state is EditUserNameSuccess) {
    return S.of(context).nameIsChanged;
  } else {
    return "";
  }
}

String getUserEditingMessageError(UserState state, BuildContext context) {
  if (state is EditUserPasswordFailure) {
    final String errorTranslation =
        LocalizationHelper.getFirebaseErrorMessage(context, state.errorMessage);
    return errorTranslation;
  } else if (state is EditUserEmailFailure) {
    final String errorTranslation =
        LocalizationHelper.getFirebaseErrorMessage(context, state.errorMessage);
    return errorTranslation;
  } else if (state is EditUserNameFailure) {
    final String errorTranslation =
        LocalizationHelper.getFirebaseErrorMessage(context, state.errorMessage);
    return errorTranslation;
  } else {
    return "";
  }
}
