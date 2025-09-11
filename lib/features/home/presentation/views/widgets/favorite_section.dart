import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubit/remove_favorite_product/remove_favorite_product_cubit.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/builder/get_favorite_product_builder.dart';
import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';

class FavoriteSection extends StatelessWidget {
  const FavoriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppBar(context,
            title: "المفضلة",
            showBackButton: true,
            showNotification: false, onBackPress: () {
          context.read<ProfileViewCubit>().changeIndex(0);
        }),
        const SizedBox(
          height: 28,
        ),
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              BlocConsumer<RemoveFavoriteProductCubit,
                  RemoveFavoriteProductState>(
                listener: (context, state) {
                  if (state is RemoveFavoriteProductSuccess) {
                    buildErrorSnackBar(
                        context, "تم حذف المنتج من المفضلة بنجاح");
                  }
                },
                builder: (context, state) {
                  return const GetFavoriteProductBuilder();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
