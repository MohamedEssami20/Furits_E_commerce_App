import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/generated/l10n.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../manager/sign_out_cubit/sign_out_cubit.dart';
import 'builder/signout_builder.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      color: const Color(0xFFEBF9F1),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              S.of(context).logout,
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF1B5E37),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await context.read<SignOutCubit>().signOut();
              },
              child: const SignOutBuilder(),
            )
          ],
        ),
      ),
    );
  }
}
