import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../features/home/presentation/manager/sign_out_cubit/sign_out_cubit.dart';

void showLogoutDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    title: S.of(context).logout,
    desc: S.of(context).doYouWantToLogout,
    btnCancelOnPress: () {},
    btnOkOnPress: () async {
      await context
          .read<SignOutCubit>()
          .signOut(genralErrorMessage: S.of(context).errorMessage);
    },
    btnOkText: S.of(context).ok,
    btnCancelText: S.of(context).cancel,
  ).show();
}
