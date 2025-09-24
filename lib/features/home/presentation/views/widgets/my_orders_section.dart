import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/manager/get_user_orders_cubit/get_user_orders_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';
import 'my_orders_list_view.dart';

class MyOrdersSection extends StatefulWidget {
  const MyOrdersSection({super.key});

  @override
  State<MyOrdersSection> createState() => _MyOrdersSectionState();
}

class _MyOrdersSectionState extends State<MyOrdersSection> {
  @override
  void initState() {
    context.read<GetUserOrdersCubit>().getUserOrders(
          genralErrorMessage: S.of(context).errorMessage,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppBar(context,
            title: S.of(context).myOrders,
            showBackButton: true,
            showNotification: false, onBackPress: () {
          context.read<ProfileViewCubit>().changeIndex(0);
        }),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: BlocBuilder<GetUserOrdersCubit, GetUserOrdersState>(
            builder: (context, state) {
              if (state is GetUserOrdersSuccess && state.ordersList.isEmpty) {
                return Center(
                    child: Text(
                  S.of(context).noOrders,
                  style: TextStyles.semiBold16.copyWith(color: Colors.black),
                ));
              }
              if (state is GetUserOrdersLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.lightSecondaryColor,
                  ),
                );
              }
              if (state is GetUserOrdersSuccess) {
                return MyOrdersListView(
                  myOrders: state.ordersList,
                );
              }
              return Text(S.of(context).errorMessage);
            },
          ),
        ),
      ],
    );
  }
}
