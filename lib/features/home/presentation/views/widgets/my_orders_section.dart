import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/my_order_item.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';

class MyOrdersSection extends StatelessWidget {
  const MyOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppBar(context,
            title: "طلباتي",
            showBackButton: true,
            showNotification: false, onBackPress: () {
          context.read<ProfileViewCubit>().changeIndex(0);
        }),
        const SizedBox(
          height: 20,
        ),
        const MyOrderItem(),
      ],
    );
  }
}
