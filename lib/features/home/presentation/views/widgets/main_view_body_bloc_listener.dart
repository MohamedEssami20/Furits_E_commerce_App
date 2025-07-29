import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/main_view_body.dart';

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
        if (state is CartProductAdded) {
          buildErrorSnackBar(context, "تمت اضافة المنتج بنجاح");
        }
      },
      child: MainViewBody(
        currentIndex: selectedIndex,
      ),
    );
  }
}
