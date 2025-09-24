import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/features/home/presentation/manager/edit_user_info_cubit/user_cubit.dart';
import 'package:fruits_hub/features/home/presentation/manager/get_user_cubit/get_user_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/profile_account_and_image.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../../core/helper/get_user_data.dart';

class EditUserIamgeBuilder extends StatelessWidget {
  const EditUserIamgeBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      builder: (context1, state) {
        if (state is EditUserImageSuccess) {
          context
              .read<GetUserCubit>()
              .getUserData(genralErrorMessage: S.of(context).errorMessage);
          return child;
        } else {
          return ProfileAccountAndImage(
            userEntity: getUserData(),
          );
        }
      },
      listener: (context, state) {
        if (state is EditUserImageSuccess) {
          Navigator.of(context).pop();
          buildErrorSnackBar(context, S.of(context).editImageSuccess);
        }
        if (state is EditUserImageFailure) {
          buildErrorSnackBar(context, S.of(context).errorMessage);
        }
      },
    );
  }
}
