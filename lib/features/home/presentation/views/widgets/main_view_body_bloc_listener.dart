import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_success_and_error_snackbar.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          buildSuccessAndErrorSnackBar(
              context, S.of(context).addProductToCartSuccess);
        }

        if (state is CartItemRemoved) {
          buildSuccessAndErrorSnackBar(
              context, S.of(context).removeProductFromCartSuccess);
        }
      },
      child: MainViewBody(
        currentIndex: selectedIndex,
      ),
    );
  }
}
