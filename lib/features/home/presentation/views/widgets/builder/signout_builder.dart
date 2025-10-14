import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/features/auth/presentation/views/signin_view.dart'
    show LoginView;
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../../core/helper/build_success_and_error_snackbar.dart';
import '../../../../../../core/helper/localization_helper.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../manager/sign_out_cubit/sign_out_cubit.dart';

class SignOutBuilder extends StatelessWidget {
  const SignOutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      builder: (context, state) {
        if (state is SignOutLoading) {
          return const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: Color(0xFF1B5E37),
            ),
          );
        } else {
          return SvgPicture.asset(
            Assets.assetsImagesExitIcon,
          );
        }
      },
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginView.routeName,
            (route) => false,
          );
          buildSuccessAndErrorSnackBar(
              context, S.of(context).logOutSuccessfully);
        }

        if (state is SignOutFailure) {
          final String errorTranslation =
              LocalizationHelper.getFirebaseErrorMessage(
                  context, state.errorMessage);
          buildSuccessAndErrorSnackBar(context, errorTranslation);
        }
      },
    );
  }
}
