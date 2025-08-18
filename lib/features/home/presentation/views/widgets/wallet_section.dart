import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return buildAppBar(
      context,
      title: "المدفوعات",
      showBackButton: true,
      showNotification: false,
      onBackPress: (){
        context.read<ProfileViewCubit>().changeIndex(0);
      }
    );
  }
}