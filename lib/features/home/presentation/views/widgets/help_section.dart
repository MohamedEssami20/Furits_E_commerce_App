import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        buildAppBar(context,
            title: S.of(context).help,
            showBackButton: true,
            showNotification: false, onBackPress: () {
          context.read<ProfileViewCubit>().changeIndex(0);
        }),
        const SizedBox(
          height: 20,
        ),
        Text(
          S.of(context).aboutUsTextPart1,
          style: TextStyles.semiBold16.copyWith(color: Colors.black),
        ),
        Text(
          S.of(context).aboutUsTextPart2,
          style: TextStyles.semiBold16.copyWith(color: Colors.black),
        ),
        Text(
          S.of(context).aboutUsTextPart3,
          style: TextStyles.semiBold16.copyWith(color: Colors.black),
        ),
        Text(
          S.of(context).aboutUsTextPart4,
          style: TextStyles.semiBold16.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
